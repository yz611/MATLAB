function x0 = m_finder(tspan,m0,s)
% Finds m
options = odeset('RelTol', 1e-5,'AbsTol',1e-5);
fun = @(m) Asympt(s,tspan,m);
x0 = fzero(fun,m0,options);
end
