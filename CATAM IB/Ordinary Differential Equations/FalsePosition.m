function [root,P] = FalsePosition( f, p_1, p_2, epsilon )
  %'False position' method to find root of a function f
  % Use this to solve f(p) = 0 by running 
  % FalsePosition( @(p) Q6(0,0,1,1,.1/(2^(i-1)),2,p), 4,5, 5e-6)
 
  a=p_1; 
  b=p_2;
  
  f_a = f(a);
  f_b = f(b);
  P = zeros(1,6);
  p = (f(b)*a-f(a)*b)/(f(b)-f(a));
  
  if ( f_a*f_b > 0 ) 
      error('f(a).f(b) must be < 0')
  end
  counter = 1;
  while abs(f(p)) > epsilon
    p = (f(b)*a-f(a)*b)/(f(b)-f(a));
    P(counter) = p;
    counter = counter+1;
    f_p = f(p);  
    
    if f_b*f_p > 0
        b = p;
        f_b = f_p;
    else
        a = p; 
    end
  end 
 
  root = (f(b)*a-f(a)*b)/(f(b)-f(a));
return 

