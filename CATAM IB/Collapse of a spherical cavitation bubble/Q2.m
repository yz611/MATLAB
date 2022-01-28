function [output] = Q2(k)
%Q2 Plot of p(r,R) against r
%   Plot on the same graph p(r,R) against r for 
%   R = 0.0, 0.1, 0.5 and 1.0.
x = linspace(0,10,1000);
y =  [0.1,0.2,0.5,1.0];
f = @(x,y) 1+(1-4*y^3+3*k*(1-3*y^2))/(3*x*y^2)-(y*((1-y^3)+3*k*(1-y^2)))/(3*x^4);
%   here f is p(r,R), x is r and y is R
z = zeros(4,1000);
for i = 1:4
    for j = 1:1000
        z(i,j) = f(x(j),y(i));
    end
    plot(x,z(i,:));
    hold on
end
output = 1;
return

