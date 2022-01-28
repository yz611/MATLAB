function[T] = Q1 (xstart, ystart, xend, h)
%Euler Method 
%xstart, ystart depend on initial condition
%xend sets the endpoint
n = (xend-xstart)/h;
x = zeros(1,n+1);
Y = zeros(1,n+1);
x(1) = xstart;
x(2) = xstart + h;
Y(1) = ystart;
Y(2) = Y(1)+h*(-8*Y(1)+6*exp(-2*x(1)));
f_xy = @(x,y) -8*y+6*exp(-2*x);
x(n+1) = xend;
for i=2:n
    x(i)   = x(i-1)+h;
    Y(i+1) = Y(i)+h*(1.5*(f_xy(x(i),Y(i)))-0.5*(f_xy(x(i-1),Y(i-1))));
end
Rownumber=string(0:n);
yexact = zeros(1,n+1);
Error  = zeros(1,n+1);
for i=1:n+1
    yexact(i) = exp(-2*x(i))-exp(-8*x(i));
    Error(i)  = Y(i)-yexact(i);
end
x=x';Y=Y';yexact=yexact';Error=Error';
T=table(x,Y,yexact,Error);
T.Properties.RowNames=Rownumber';
plot(x,Error);
return