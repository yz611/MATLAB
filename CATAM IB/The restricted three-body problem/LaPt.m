function [] = LaPt(mu)
%LaPt finds and draws the Lagrangian points of the system
func = @(x) -x+(1-mu)*(x-mu)/(abs(x-mu)^3)+mu*(x+1-mu)/(abs(x+1-mu)^3);
x = linspace(-2,2);
y = [];
for i = 1:length(x)
    z = fzero(func,x(i));
    if (abs(func(z)) < 1)
        y(length(y)+1) = round(z,4);
    end
end
y = unique(y);
scatter(y(1),0,'fill','DisplayName','LP1')
hold on
scatter(y(2),0,'fill','Displayname','LP2')
hold on
scatter(y(3),0,'fill','DisplayName','LP3')
hold on
scatter(mu-1/2,sqrt(3)/2,'fill','DisplayName','LP4')
hold on
scatter(mu-1/2,-sqrt(3)/2,'fill','DisplayName','LP5')
legend