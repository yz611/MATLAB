function f = Asympt(S,tspan,m)
y0 = [0 0 S];
options = odeset('RelTol', 1e-5,'AbsTol',1e-5);
[t,y] = ode45(@(t,y) FalknerSkan(t,y,m), tspan, y0,options);
l = length(tspan);
function dy = FalknerSkan(t,y,m)
dy = zeros(3,1);
dy(1) = y(2);
dy(2) = y(3);
dy(3) = m*y(2)^2 - (1/2)*(1+m)*y(1)*y(3) - m;
end
f = y(l,2)-1;
end