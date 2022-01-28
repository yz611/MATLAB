function[output] = forwardEuler (xstart, ystart, xend, h)
% foward Euler Method 
% xstart, ystart depend on initial condition
% xend sets the endpoint
% h sets the gap
n = (xend-xstart)/h;
x = zeros(1,n+1);
Y = zeros(1,n+1);
x(1) = xstart;
Y(1) = ystart;
f_xy = @(x,y) -8*y+6*exp(-2*x); 
for i=1:n
    x(i+1) = x(i) + h;
    Y(i+1) = Y(i) + h*(f_xy(x(i), Y(i))); 
end
output = Y(n+1);
return