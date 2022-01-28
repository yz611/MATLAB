function[output] = Q4_1 (h,t_0,k)
%Euler Method 
t = linspace(0,1,1/h+1);
x = zeros(1,1/h+1);
f = @(x) -(5/2)*((2/3)*(1-(x^6)^(1/5))+2*k*(1-(x^4)^(1/5)))^(1/2);
x(1) = 1;
x(2) = 1-(5/4)*t_0^2;
for i=2:1/h
    x(i+1) = x(i)+h*f(x(i));
end
x = x.^2;
x = x.^(1/5);
output = plot(t,x);
return

