%These codes show the position of P_h, 
%   and draw the trajectory of the third object
%    corresponding to the numerical solution of the
%    dynamical system with specified initial conditions
a = 0.01;
[t,y] = Modsolver(0.5,[0,10],[0.5+a;0;0;a*(-1+(1+1/(2*a^3))^(1/2))]);
plot(y(:,1),y(:,2),'DisplayName','trajectory')
hold on
scatter(0.5,0,'filled','Displayname','P_h');
legend
xlabel('x');
ylabel('y');
title('Trajectory of the thied object sufficiently close to P_h');
