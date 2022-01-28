xmin = 0;
xmax = 1.5;
tmax = 0.5;
h = 0.01;
k = 0.5*h;
N = round((xmax-xmin)/h)+1;
xgrid = xmin:h:xmax;
M = round(tmax/k);


syms u0(x)
u0(x) = piecewise(x<0, 0, ...
    0<=x & x<0.5, -0.5, 0.5<=x & x<1, ...
    1, x>=1 & x<=1.5, 0, ...
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

syms limiter(r)
limiter(r) = piecewise(r<=0, 0, r>=0 & r<=1, r, r>=1, 1);


u1 = uinit;
u2 = u1;

F = zeros(1,N);
FRi = F;
FLF = F;
URi = F;
FHI = F;
FLO = F;
r = F;
phi = ones(1,N);

for m = 1:M
    for i = 2:N-3

        URi(i) = 0.5*(u1(i-1)+u1(i)) ...
            +0.5*(k/h)*(f(u1(i-1))-f(u1(i)));
        URi(i+1) = 0.5*(u1(i)+u1(i+1)) ...
            +0.5*(k/h)*(f(u1(i))-f(u1(i+1)));
        FRi(i) = f(URi(i));
        FRi(i+1) = f(URi(i+1));
        
        FLF(i) = 0.5*(f(u1(i-1))+f(u1(i))) ...
            +0.5*(h/k)*(u1(i-1)-u1(i));
        FLF(i+1) = 0.5*(f(u1(i))+f(u1(i+1))) ...
            +0.5*(h/k)*(u1(i)-u1(i+1));
        
        FHI(i) = FRi(i); 
        FHI(i+1) = FRi(i+1);
        
        FLO(i) = 0.5*(FLF(i)+FRi(i));
        FLO(i+1) = 0.5*(FLF(i+1)+FRi(i+1));
        
        if (u1(i)-u1(i-1) == 0 && u1(i+1)-u1(i) == 0)
            delta1 = 1;
        elseif (u1(i+1)-u1(i) == 0 && u1(i)-u1(i-1) > 0)
            delta1 = 2;
        elseif (u1(i+1)-u1(i) == 0 && u1(i)-u1(i-1) < 0)
            delta1 = -2;
            else
            delta1 = (u1(i)-u1(i-1))/(u1(i+1)-u1(i));
        end
        
        if (u1(i+1)-u1(i) == 0 && u1(i+2)-u1(i+1) == 0)
            delta2 = 1;
        elseif (u1(i+2)-u1(i+1) > 0 && u1(i+1)-u1(i) == 0)
            delta2 = 2;
        elseif (u1(i+2)-u1(i+1) < 0 && u1(i+1)-u1(i) == 0)
            delta2 = -2;
        else
            delta2 = (u1(i+2)-u1(i+1))/(u1(i+1)-u1(i));     
        end 
        
        if (u1(i+3)-u1(i+2) == 0 && u1(i+2)-u1(i+1) == 0)
            delta3 = 1;
        elseif (u1(i+3)-u1(i+2) > 0 && u1(i+2)-u1(i+1) == 0)
            delta3 = 2;
        elseif (u1(i+3)-u1(i+2) < 0 && u1(i+2)-u1(i+1) == 0)
            delta3 = -2;
        else
            delta3 = (u1(i+3)-u1(i+2))/(u1(i+2)-u1(i+1));
        end 
        
        r(i) = min(delta1, delta2) ;
        r(i+1) = min(delta2, delta3) ;
        
        phi(i) = double(limiter(r(i)));
        phi(i+1) = double(limiter(r(i+1)));
        
        
        F(i) = FLO(i)+phi(i)*(FHI(i)-FLO(i));
        F(i+1) = FLO(i+1)+phi(i+1)*(FHI(i+1)-FLO(i+1));
        
        u2(i) = u1(i) + (k/h)*(F(i)-F(i+1));
    end
    u2(1) = u2(2);
    u2(N-2) = u2(N-3);
    u2(N-1) = u2(N-2);
    u2(N) = u2(N-1);
    u1 = u2;
    plot(xgrid,u2)
    pause(0.001)
end
hold on
plot(xgrid,uexact)
title('FLIC and exact solutions at t = 0.5')
xlabel x
ylabel u
        