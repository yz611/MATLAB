x = [-1.1232,0.2861,1.2567];
delta = 0.01;
for i = 1:length(x)
    [t,y] = Solver1(0.7,[0,30],[x(i)+delta;0;0;1]);
    x_gainst_t = figure();
    plot(t,y(:,1))
    title('x against t')
    
    y_against_t = figure();
    plot(t,y(:,2))
    title('y against t')
    
    trajectory = figure();
    plot(y(:,1),y(:,2))
    title('trajectory')
end