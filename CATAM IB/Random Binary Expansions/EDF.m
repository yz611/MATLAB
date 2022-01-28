function [F] = EDF(x, X)
% Empirical distribution function(EDF)
% By Monte Carlo Simulation, 
% obtain the EDF.   
F = zeros(1, length(x));
% Initialize F.
for i = 1: length(x)
    for j = 1: length(X)
        if X(j) <= x(i)
        F(i) = F(i) + 1;
        end
    end
end
F = F./length(X);
return


