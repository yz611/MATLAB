function [] = OmegaContours(mu)
x = -1.3:.001:1.3;
y = -0.5:.001:0.5;
Z = NaN(length(x),length(y));
for a=1:length(x)
    for b=1:length(y)
        X=[x(a),y(b),0,0];
        Z(a,b) = Potent(X,mu);
    end
end
contour(x,y,Z',100,'DisplayName','Contours of Omega')
legend
end