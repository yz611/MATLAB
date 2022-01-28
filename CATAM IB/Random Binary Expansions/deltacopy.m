x = zeros(1, 10);
for i = 1: 10
    x(i) = (2^(-(10+i)) + 10/16);
end

y = zeros(1, 10);
for i = 1: 10
    y(i) = (-2^(-(i+10)) + (10/16));
end