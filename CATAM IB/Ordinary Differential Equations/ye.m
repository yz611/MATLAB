function[yexact]=ye(p)
yexact = 2*((4*p^2-1)^(-1/2))*exp(log(2)/2)*sin(((4*p^2-1)^(1/2))*(1/2)*log(2));
return