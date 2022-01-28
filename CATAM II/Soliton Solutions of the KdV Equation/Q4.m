
function umax = Q4(tmax)
%prep
xmax = 1;%input('Enter a length')
xmin = 0;
%tmax = 0.95;%input('Enter a time');
h = 0.005;%input('Enter a spacing')
N = round((xmax-xmin)/h);
delta = 0.03;%input('Enter a scale(delta)')
k = (h^3)/(4*delta^2+h^2);%input('Enter a value for time step');
M = round(tmax/k-1);
xgrid = xmin:h:xmax;
xgrid = xgrid';


%numerical
uinit = sin(pi*2*xgrid);

u1 = zeros(N+1,1);
u2 = u1;

alpha = k/(3*h);
beta = (k*delta^2)/(h^3);


%First Step
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

umax = max(u2);
plot(xgrid,u2)
xlabel x
ylabel u
end
