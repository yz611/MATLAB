
V_0 = [-1,-1.5,-1.73,-1.78,-1.853];
for i = 1: length(V_0)
    str = strcat('v_0 = ',num2str(V_0(i)));
    [t,y] = Solver1(0.5,[0,30],[0.32;0;0;V_0(i)]);
    figure(i)
    plot(y(:,1),y(:,2),'DisplayName','trajectory')
    title(str)
    hold on
    scatter(-0.5,0,'fill','DisplayName','P_l')
    scatter(0.5,0,'fill','DisplayName','P_h')
    Fob_Reg(V_0(i),0.5)
    legend
end