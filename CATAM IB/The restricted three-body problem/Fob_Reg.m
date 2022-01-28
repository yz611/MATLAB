function [] = Fob_Reg(v_0,mu)
J = Const([0.32,0,0,v_0],mu);
x = -1.3:.001:1.3;
y = -1.3:.001:1.3;
Z = NaN(length(x),length(y));
for a=1:length(x)
    for b=1:length(y)
        X=[x(a),y(b),0,0];
        Omega = Potent(X,mu);
        if (Omega>J)
            Z(a,b)=1;
        end
    end
end
contourf(x,y,Z',[1,1],'DisplayName','Forbidden Region boundary')
end