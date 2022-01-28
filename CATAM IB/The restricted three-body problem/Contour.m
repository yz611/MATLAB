function [] = Contour(X,mu)
J = Const(X,mu);
x = -1.3:.001:1.3;
y = -1.3:.001:1.3;
Z = NaN(length(x),length(y));
for a=1:length(x)
    for b=1:length(y)
        X=[x(a),y(b),0,0];
        Omega = Potent(X,mu);
        if (Omega>J)
            Z(a,b)=Omega;
        end
    end
end
contourf(x,y,Z','DisplayName','Forbidden Region boundary')
end