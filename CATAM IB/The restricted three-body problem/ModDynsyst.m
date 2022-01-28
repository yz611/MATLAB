function dydt = ModDynsyst(y,k)
%Modified defines the dynamical system.
%   Here we set (dx/dt, dy/dt) = (y(3), y(4)), mu = k
a = (y(1)-k)^2+y(2)^2;
z = (1/2)*(y(1)-k)*a^(-3/2);
w = (1/2)*y(2)*a^(-3/2);
dydt = [y(3); y(4); 2*y(4)-z; -2*y(3)-w];


