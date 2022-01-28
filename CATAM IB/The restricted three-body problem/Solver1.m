function [t,y] = Solver1(mu,t_0,y_0)
%Solver1 solves the system numerically .
%         Here we used the function Dynsyst()
%         which defines the Dynamical System.
options = odeset('Reltol',1e-10,'AbsTol',1e-10);
[t,y] = ode45(@(t,y) Dynsyst(y,mu),t_0,y_0,options);
end