function Q4(tspan,n)
m = linspace (-0.62,0,n);
s = linspace (-0.3,0,n);
for i = 1:length(m)
    for j = 1:length(s)
       try
         s(i) = S_finder(tspan,m(i),s(j));
       catch
         m(i) = m_finder(tspan,m(i),s(j));
       end
    end
end

plot(m,s)