function [t,y] = Modsolver(k,t_0,y_0)
%Modsolver solves the system in Question 2 numerically.
%          Here we use function Modified defined previously.
options = odeset('Reltol',1e-10,'AbsTol',1e-10);
[t,y] = ode45(@(t,y) ModDynsyst(y,k),t_0,y_0,options);
end


