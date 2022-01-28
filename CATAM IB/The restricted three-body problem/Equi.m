function [] = Equi(mu)
x = mu-1/2;
delta = 1e-10;
[t,y] = Solver1(mu,[0,30],[x+delta;sqrt(3)/2;0;0]);
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

