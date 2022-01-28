function [Omega] = Potent(X,mu)
%Const calculates the potential of motion J

x=X(1);
y=X(2);
z=X(3);
w=X(4);
a=sqrt(((x+1-mu).^2)+(y.^2));
b=sqrt(((x-mu).^2)+(y.^2));
Omega =(-1/2)*((x.^2)+(y.^2)) -((1-mu)./b)-(mu./a);
end