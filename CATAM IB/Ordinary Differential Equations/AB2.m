function[output] = AB2 (xstart, ystart, xend, h)
% AB2 Method 
% xstart, ystart depend on initial condition
% x end sets the endpoint
% applies Euler to first step
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
output =Y(n+1);

return