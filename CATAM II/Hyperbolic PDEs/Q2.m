
xmin = 0;
xmax = 1.5;
tmax = 0.5;
h = 0.001;
k = 0.1*h;
N = round((xmax-xmin)/h)+1;
xgrid = xmin:h:xmax;
M = round(tmax/k);


syms u0(x)
u0(x) = piecewise(x<0, 0, ...
    0<=x & x<0.5, -0.5, 0.5<=x & x<1, 1, x>=1 & x<=1.5, 0, ...
    x>1.5, 0);
uinit = double(u0(xgrid));
f = @(x) 0.5*x^2;

a1 = @(t) (1-t)/2;
a2 = @(t) t+1/2;
a3 = @(t) t/2+1;

b1 = a1(1/2);
b2 = a2(1/2);
b3 = a3(1/2);

syms uexact(x)
v(x) = piecewise(x>0 & x<b1, -1/2, ...
    b1<=x & x<b2, (2*x-1)/(2*1/2), ...
    b2<=x & x<b3, 1, ...
    x>=b3, 0);

uexact = double(v(xgrid));


u1 = uinit;
u2 = u1;

Flux = zeros(1,N);

for m = 1:M
    for i = 2:N-1
        Flux(i) = 0.5*(f(u1(i-1))+f(u1(i))) ...
            +0.5*(h/k)*(u1(i-1)-u1(i));
        Flux(i+1) = 0.5*(f(u1(i))+f(u1(i+1))) ...
            +0.5*(h/k)*(u1(i)-u1(i+1));
        u2(i) = u1(i) + (k/h)*(Flux(i) - Flux(i+1));
    end
    u2(1) = u2(2);
    u2(N) = u2(N-1);
    u1 = u2;
    plot(xgrid,u2)
    pause(0.001)
end
hold on
plot(xgrid,uexact)
title('LF and exact solutions at t = 0.5')
xlabel x
ylabel u
        