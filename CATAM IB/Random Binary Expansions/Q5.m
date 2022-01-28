function [G] = Q5(x, p, n, c)
% The distribution function for some values of x
% F is calculated as shown in report;
y = x*2^n;
z = de2bi((0:1:2^(n)));
% here use range up to 2^(n+1) 
% as there is input value greater than 1
F = zeros(1, size(y, 2));
delta = x-c;
q = 1-p;
k = sum(z' == 1);

Fc = zeros(1, size(y, 2));
for i = 1: 10
    for j = 1: (2^n)*(c)
        Fc(i) = Fc(i) + (q)^(n)*(p/q)^(k(j));
    end
end
% function value at c
for i = 1: size(y,2)
   for j = 1: y(i)
       F(i) = F(i) + (q)^(n)*(p/q)^(k(j));
   end
end
for i = 1: size(y,2)
    F(i) = (F(i)-Fc(i))/delta(i);
end
G = plot(delta, F);
return

