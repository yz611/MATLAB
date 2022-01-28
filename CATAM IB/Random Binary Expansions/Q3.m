function [G] = Q3(x, p, n)
% The distribution function for some values of x
% x is a matrix of finite 0-1 rows;
% F is calculated as shown in report;
% In command window input Q3((0:2^(-11):1), 3/4, 11) to generate the graph.
y = x*2^n;
q = 1-p;
z = de2bi((0:1:2^(n+1)));
% here use range up to 2^(n+1) as there is input value greater than 1
F = zeros(1, size(y, 2));
k = sum(z' == 1);
for i = 1: size(y,2)
   for j = 1: y(i)
       F(i) = F(i) + (q)^(n)*(p/q)^(k(j));
   end
end
G = plot(x, F);
return

