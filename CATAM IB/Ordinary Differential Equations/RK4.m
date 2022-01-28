function[output] = RK4 (xstart, ystart, xend, h)
% RK4 Method 
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
    x(i+1) = x(i)+h;
    k_1 = f_xy(x(i),Y(i));
    k_2 = f_xy(x(i)+0.5*h,Y(i)+0.5*h*k_1);
    k_3 = f_xy((x(i)+0.5*h),(Y(i)+0.5*h*k_2));
    k_4 = f_xy((x(i)+h),(Y(i)+k_3*h));
    Y(i+1) = Y(i) + (h/6)*(k_1+2*k_2+2*k_3+k_4); 
end
output = Y(n+1);
return