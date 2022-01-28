function x0 = S_finder(tspan,m,S0)
% Finds S_m for value m in [0,1]
options = odeset('RelTol', 1e-5,'AbsTol',1e-5);
fun = @(x) Asympt(x,tspan,m);
x0 = fzero(fun,S0,options);
end

