

%prep
xmax = 60;%input('Enter a length')
xmin = 0;
tmax = 50;%input('Enter a time');
h = 0.005;%input('Enter a spacing')
N = round((xmax-xmin)/h);
k = 0.001;%input('Enter a value for time step');
M = round(tmax/k-1);
q = 0;
xgrid = xmin:h:xmax;
xgrid = xgrid';




FT = @(x) -16*((x.^2-3).*sin(x)+3*x.*cos(x))./(x.^5);
ftilde = FT(xgrid);

Asym = @(x,t) (sqrt(q).*t./(sqrt(2.*pi).*(t.^2-x.^2).^(3/4))) ...
    .*FT((q.*x)./sqrt(t.^2-x.^2)).*cos(q.*sqrt(t.^2-x.^2)+pi/4);

StaPh = Asym(xgrid,tmax);

uinit = IC(xgrid);
uexact = 0.5*IC(xgrid-tmax);


u1 = zeros(N+1,1);
u2 = u1;

A = (k^2)*(1/(h^2)-(q^2)/2);
B = 2*(1-(k/h)^2);
C = A;
u0 = uinit;
%First step
u1(1) = (A*u0(2)+B*u0(1)+C*u0(2))/2;

for n = 2:N-1
    u1(n) = (A*u0(n+1)+B*u0(n)+C*u0(n-1))/2;
end


for m = 1:M
     
    u2(1) = -u0(1)+A*u1(2)+B*u1(1)+C*u1(2);
    
    for n = 2:N
        u2(n) = -u0(n)+A*u1(n+1)+B*u1(n)+C*u1(n-1);
    end
   
    u0 = u1;
    u1 = u2;

end

error = abs(u2 - uexact);

plot(xgrid,u2)
hold on
plot(xgrid,uexact)
xlabel x
ylabel u



function [y] = IC(x)
 y = x;
 for i = 1:length(x)
     if abs(x(i)) >= 1
         y(i) = 0;
     else
         y(i) = (1-x(i)^2)^2;
     end
 end
end




