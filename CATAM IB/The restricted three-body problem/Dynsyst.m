function dydt = Dynsyst(y,k)
%Dynsyst defines the dynamical system.
%   
a = (y(1)+1-k)^2+y(2)^2;
b = (y(1)-k)^2+y(2)^2;
z = -y(1)+k*(y(1)+1-k)*a^(-3/2)+(1-k)*(y(1)-k)*b^(-3/2);
w = -y(2)+k*y(2)*a^(-3/2)+(1-k)*y(2)*b^(-3/2);
dydt = [y(3); y(4); 2*y(4)-z; -2*y(3)-w];


