
xmax = 1;
N = input('Enter a value for N');
h = xmax/N;
x = 0:h:xmax;
v = input('Enter a value for the Courant number');
k = v*h^2;
tmax = input('Enter a representative time');
choice = input('Choose a scheme');
t = 0:k:tmax;
I = input('Draw the asymptotic limit? If yes enter 0');

theta0 = zeros(N-1,1);
thetaL = @(t) t*(3*t-2);
thetaR = 0;


A = zeros(N-1);
A(1,1) = -2; A(N-1,N-1) = -2;
A(1,2) = 1; A(N-1,N-2) = 1;
for i = 2:N-2
    A(i,i-1) = 1;
    A(i,i) = -2;
    A(i,i+1) = 1;
end
A = sparse(A);
H1 = sparse(eye(N-1)+v*A);

U1 = iter1(H1,v,theta0,thetaL,thetaR,N,tmax,k);
U2 = iter2(A,v,theta0,thetaL,thetaR,N,tmax,k);

rho = input('enter a value for rho');
L = sparse(eye(N-1)-rho*v*A);
R = sparse(eye(N-1)+(1-rho)*v*A);
U3 = iter3(L,R,v,rho,theta0,thetaL,thetaR,N,tmax,k);
l = length(U1(1,:));
a = thetaL(tmax);

u1 = [a;U1(:,l);0];
u2 = [a;U2(:,l);0];
u3 = [a;U3(:,l);0];
f = lim(x,tmax);

if choice == 1
    plot(x,u1,'LineStyle','--')
    hold on
else
    if choice == 2
        plot(x,u2,'LineStyle','--')
        hold on
    else
        plot(x,u3,'LineStyle','--')
        hold on
    end
end


xlabel x
ylabel \theta

if I == 0
    plot(x,f);
end

function U = iter1(H,v,theta0,thetaL,thetaR,N,tmax,k)
  M = round(tmax/k+1);
  U = zeros(N-1,M);
  b = zeros(N-1,M);
  U(:,1) = theta0;
  for m = 1:M-1
      b(1,m) = thetaL((m-1)*k);
      b(N-1,m) = thetaR;
      U(:,m+1) = H*U(:,m) + v*b(:,m);
  end
end

function U = iter2(A,v,theta0,thetaL,thetaR,N,tmax,k)
  M = round(tmax/k+1);
  U = zeros(N-1,M);
  b = zeros(N-1,M);
  U(:,1) = theta0;
  U(:,2) = U(:,1)+ v*A*U(:,1) + v*b(:,1);
  b(1,1) = thetaL(0);
  b(N-1,1) = thetaR;
  for m = 2:M-1
      b(1,m) = thetaL((m-1)*k);
      b(N-1,m) = thetaR;
  end
  for m = 2:M-1
      U(:,m+1) = 2*v*A*U(:,m) + U(:,m-1) + 2*v*b(:,m);
  end
end

function U = iter3(L,R,v,rho,theta0,thetaL,thetaR,N,tmax,k)
  M = round(tmax/k+1);
  U = zeros(N-1,M);
  b = zeros(N-1,M);
  U(:,1) = theta0;
  for m = 1:M
      b(1,m) = thetaL((m-1)*k);
      b(N-1,m) = thetaR;
  end
  for m = 1:M-1
      U(:,m+1) = L\(R*U(:,m) + (1-rho)*v*b(:,m) + rho*v*b(:,m+1));
  end
end

function f = lim(x,tmax)
  alpha = @(x) -x*(x-2)*(x-1);
  beta = @(x) -0.05*x*(x-1)*(x-2)*(x+2)*(x-4);
  f = zeros(1,length(x));
  for i = 1:length(x)
     f(i) = (3*tmax-2)*tmax*(1-x(i))+alpha(x(i))*tmax+beta(x(i));
  end
end    



