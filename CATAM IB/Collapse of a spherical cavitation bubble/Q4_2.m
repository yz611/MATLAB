function[output] = Q4_2 (h,t_0,k)
%Euler Method 
t = linspace(0,1,1/h+1);
x = zeros(1,1/h+1);
p = zeros(1,1/h+1);
f = @(x) -(5/2)*((2/3)*(1-(x^6)^(1/5))+2*k*(1-(x^4)^(1/5)))^(1/2);
x(1) = 1;
x(2) = 1-(5/4)*t_0^2;
for i=2:1/h
    x(i+1) = x(i)+h*f(x(i));
end
x = x.^2;
x = x.^(1/5);
for i=1:1/h
    a = (1/4)*(1-4*x(i)^3);
    b = 1-x(i)^3;
    if a < 0
        p(i) = 1;
    else
        p(i) = 1+x(i)^(-3)*(a^4/b)^(1/3);
    end
end
            
output = plot(t,p);
return
