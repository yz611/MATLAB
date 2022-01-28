function [J] = Const(X,mu)
%Const calculates the constant of motion J

x=X(1);
y=X(2);
xdot=X(3);
ydot=X(4);
a=sqrt(((x+1-mu).^2)+(y.^2));
b=sqrt(((x-mu).^2)+(y.^2));
J =(-1/2)*((x.^2)+(y.^2)) -((1-mu)./b)-(mu./a)+(1/2)*((xdot.^2)+(ydot.^2));
end