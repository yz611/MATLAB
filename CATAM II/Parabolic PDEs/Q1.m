



t = input('Enter a time t');
N = input('Enter a truncation number N');
h = input('Enter a space interval size h');
x = 0.0:h:1;

for i = 1:length(t)
   y = Theta(x,t(i),N);
   plot(x,y)
   hold on
end
legend('t = 0.1','t = 2/3', 't = 1')
xlabel position(x)
ylabel Temperature(\theta)

function phi = phi(x,t,N)
  g = @(n,x,t) 4*(1-3*t)*(n^3*pi^3)^-1+12*(n^5*pi^5)^-1 ...
  -(4*(1+3*(n^2*pi^2)^-1)*(n^3*pi^3)^-1)*exp(-n^2*pi^2*t);
  sum = 0;
  for i = 1:N
     sum = sum + g(i,x,t)*sin(i*pi*x);
  end
  phi = sum; 
end    
    

function Theta = Theta(x,t,N)
  theta = @(x,t,N) phi(x,t,N)+(3*t-2)*t*(1-x);
  Theta = zeros(1,length(x));
  for j = 1:length(x)
   Theta(j) = theta(x(j),t,N);
  end
end

