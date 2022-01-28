function [] = LagContour(mu)
x = -1.3:.001:1.3;
y = -1.3:.001:1.3;
Z = NaN(length(x),length(y));
for a=1:length(x)
    for b=1:length(y)
        X=[x(a),y(b),0,0];
        Z(a,b) = Potent(X,mu);
    end
end
contour(x,y,Z',[1,1],'DisplayName','Forbidden Region boundary')
end