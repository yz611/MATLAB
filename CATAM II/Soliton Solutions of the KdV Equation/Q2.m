

%prep
xmax = 10;%input('Enter a length')
xmin = -10;
tmax = 0.5;%input('Enter a time');
h = 0.005;%input('Enter a spacing')
N = round((xmax-xmin)/h);
a = 2;%input('Enter an amplitude');
delta = 0.03;%input('Enter a scale(delta)')
k = (h^3)/(4*delta^2+a*h^2);%input('Enter a value for time step');
M = round(tmax/k-1);
x0 = 0.25;%;input('Enter an initial location');
c = a/3;
D = sqrt(delta^2*12*a^-1);
xgrid = xmin:h:xmax;
xgrid = xgrid';

%analytic
soliton = @(x,t) a*(sech(sqrt(a/(delta*12))*(x-c*t-x0)).^2);
soli = soliton(xgrid,tmax);

%numerical
uinit = soliton(xgrid,0);

u1 = zeros(N+1,1);
u2 = u1;

alpha = k/(3*h);
beta = (k*delta^2)/(h^3);


%First step
u1(1) = uinit(1)-0.5*alpha*(uinit(2)+uinit(1) ...
    +uinit(N))*(uinit(2)-uinit(N)) ...
    -0.5*beta*(uinit(3)-2*uinit(2)+2*uinit(N)-uinit(N-1));

u1(2) = uinit(2)-0.5*alpha*(uinit(3)+uinit(2) ...
    +uinit(1))*(uinit(3)-uinit(1)) ...
    -0.5*beta*(uinit(4)-2*uinit(3)+2*uinit(1)-uinit(N));

u1(N) = uinit(N)-0.5*alpha*(uinit(N+1)+uinit(N)...
    +uinit(N-1))*(uinit(N+1)-uinit(N-1)) ...
    -0.5*beta*(uinit(2)-2*uinit(N+1)+2*uinit(N-1)-uinit(N-2));

u1(N+1) = uinit(N+1)-0.5*alpha*(uinit(2)+uinit(N+1) ...
    +uinit(N))*(uinit(2)-uinit(N)) ...
    -0.5*beta*(uinit(3)-2*uinit(2)+2*uinit(N)-uinit(N-1));


for n = 3:N-1
    u1(n) = uinit(n)-0.5*alpha*(uinit(n+1)+uinit(n) ...
        +uinit(n-1))*(uinit(n+1)-uinit(n-1)) ...
        -0.5*beta*(uinit(n+2)-2*uinit(n+1)+2*uinit(n-1)-uinit(n-2));
end


u0 = uinit;
%leapfrog
for m = 1:M
     
    u2(1) = u0(1)-alpha*(u1(2)+u1(1)+u1(N))*(u1(2)-u1(N)) ...
        -beta*(u1(3)-2*u1(2)+2*u1(N)-u1(N-1));
    u2(2) = u0(2)-alpha*(u1(3)+u1(2)+u1(1))*(u1(3)-u1(1)) ...
        -beta*(u1(4)-2*u1(3)+2*u1(1)-u1(N));
    
    for n = 3:N-1
        u2(n) = u0(n)-alpha*(u1(n+1)+u1(n)+u1(n-1)) ...
            *(u1(n+1)-u1(n-1)) ...
            -beta*(u1(n+2)-2*u1(n+1)+2*u1(n-1)-u1(n-2));
    end
    
    u2(N) = u0(N)-alpha*(u1(N+1)+u1(N) ...
        +u1(N-1))*(u1(N+1)-u1(N-1))- ...
        beta*(u1(2)-2*u1(N+1)+2*u1(N-1)-u1(N-2));
    u2(N+1) = u0(N+1)-alpha*(u1(2)+u1(N+1) ...
        +u1(N))*(u1(2)-u1(N))- ...
        beta*(u1(3)-2*u1(2)+2*u1(N)-u1(N-1));
    
    u0 = u1;
    u1 = u2;
    
   
end

error = abs(u2 - soli);

plot(xgrid,u2)
hold on
plot(xgrid,soli)
axis([xmin xmax 0 2*a]);
xlabel x
ylabel u
title('Numerical and 1-soliton solutions')
legend('numerical', '1-soliton')
