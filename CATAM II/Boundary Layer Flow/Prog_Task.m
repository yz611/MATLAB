function y = Prog_Task(S,tspan,m)
y0 = [0 0 S];
options = odeset('RelTol', 1e-8,'AbsTol',1e-8);
[t,y] = ode45(@(t,y) FalknerSkan(t,y,m), tspan, y0,options);
function dy = FalknerSkan(t,y,m)
dy = zeros(3,1);
dy(1) = y(2);
dy(2) = y(3);
dy(3) = m*y(2)^2 - (1/2)*(1+m)*y(1)*y(3) - m;
end
end