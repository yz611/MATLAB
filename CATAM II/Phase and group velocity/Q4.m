

%prep
xmax = 150;%input('Enter a length')
xmin = 0;
tmax = 150;%input('Enter a time');
h = 0.005;%input('Enter a spacing')
N = round((xmax-xmin)/h);
k = 0.001;%input('Enter a value for time step');
M = round(tmax/k-1);
q = 0;
w0 = 1.5;
xgrid = xmin:h:xmax;
xgrid = xgrid';

uinit = zeros(N+1,1);


u1 = zeros(N+1,1);
u2 = u1;

A = (k^2)*(1/(h^2)-(q^2)/2);
B = 2*(1-(k/h)^2);
C = A;
u0 = uinit;
%First step
u1(1) = sin(w0*k);

for n = 2:N-1
    u1(n) = (A*u0(n+1)+B*u0(n)+C*u0(n-1))/2;
end


for m = 1:M
    
    u1(1) = sin(w0*(m+1)*k);
    
    for n = 2:N
        u2(n) = -u0(n)+A*u1(n+1)+B*u1(n)+C*u1(n-1);
    end
   
    u0 = u1;
    u1 = u2;
end


plot(xgrid,u2)
hold on
xlabel x
ylabel u





