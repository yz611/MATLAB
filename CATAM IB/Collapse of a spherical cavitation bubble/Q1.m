function [output] = Q1(~)
%Q1 Plot of dR/dt against R
%   Plot on the same graph ln(dR/dt) against ln(R) for 
%   lambda = 0.0, 0.1, 1.0, 10.0 and 100.0.
x = linspace(0,1,100);
y =  [0.0,0.1,1.0,10.0,100.0];
f = @(x,y) sqrt((2/3)*(1/x^3-1) + 2*y*(1/x^3-1/x));
%   here f is dR/dt, x is R and y is lambda
z = zeros(5,100);
for i = 1:5
    for j = 1:100
        z(i,j) = f(x(j),y(i));
    end
    plot(x,z(i,:));
    hold on
end
output = 1;
return

