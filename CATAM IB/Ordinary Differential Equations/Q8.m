% Choose a suitable interval;
x = 0:.01:1;

% Calculte the first five eigenvalues;
p(1) = FalsePosition( @(p) Q6(0,0,1,1,.1/(2^(12)),10,p),12,13, 5e-6)
p(2) = FalsePosition( @(p) Q6(0,0,1,1,.1/(2^(12)),10,p), 26,27, 5e-6)
p(3) = FalsePosition( @(p) Q6(0,0,1,1,.1/(2^(12)),10,p), 39,40, 5e-6)
p(4) = FalsePosition( @(p) Q6(0,0,1,1,.1/(2^(12)),10,p), 53,54, 5e-6)
p(5) = FalsePosition( @(p) Q6(0,0,1,1,.1/(2^(12)),10,p),66,67, 5e-6)

% Calculate normalising factors;
f_ki = @(k,i) ((1+x(i))^(-10))*(p(k)*y_ki(k,i))^2
for k = 1:5;for i =1:length(x);A(k,i) = f_ki(k,i);end;end
for i = 1:5; C(i) = (trapz(0.01*A(i,1:101)))^(1/2);end

% plot the normalised numerical solutions;
y_kx = @(k,i) Q6(0,0,1,x(i),.1/(2^(12)),10,p(k))/C(k)
for i = 1:length(x); y_1(i)=y_kx(1,i);end
for i = 1:length(x); y_2(i)=y_kx(2,i);end
for i = 1:length(x); y_3(i)=y_kx(3,i);end
for i = 1:length(x); y_4(i)=y_kx(4,i);end
for i = 1:length(x); y_5(i)=y_kx(5,i);end
plot(x,y_1)
hold on
plot(x,y_2)
hold on
plot(x,y_3)
hold on
plot(x,y_4)
hold on
plot(x,y_5)
hold on