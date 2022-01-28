function [X] = RandomSample(n,N,p)
% Sample Generator: 
% Generates a random N by n matrix
% with each row a finite
% sequence of 0 and 1's. 
U = zeros(N,n);
% Initialize the matrix
for i = 1:N
  for j = 1:n
      U(i,j) = binornd(1,p);
  end
end
X = zeros(1,N);
% Initialize the random sample
for i=1:N
    for j = 1:n
    X(1,i) = X(1,i) + 2^(-j)*U(i,j);
    end
end
return
