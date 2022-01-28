function [y] = yexact (x)
y = zeros(1,length(x));
for i=1:length(x)
    y(i) = exp(-2*x(i))-exp(-8*x(i));
end
