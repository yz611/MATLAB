opts = [0.1,0.5,0.7];
X = [1,0,0,0];
for i = 1:length(opts)
    figure(i)
    Contour(X,opts(i))
    hold on
    LaPt(opts(i))
end
