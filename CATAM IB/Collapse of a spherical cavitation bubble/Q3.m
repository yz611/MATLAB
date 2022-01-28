function[output] = Q3 (h,t_0)
%Euler Method 
t = linspace(t_0,1,(1-t_0)/h+1);
x = zeros(1,(1-t_0)/h+1);
f = @(x) -(5/2)*((2/3)*(1-(x^6)^(1/5)))^(1/2) ;
x(1) = 1-(5/4)*t_0^2;
for i=1:(1-t_0)/h
    x(i+1) = x(i)+h*f(x(i));
end
output = plot(t,x);
return