function[Youtput, Zoutput] = Q6 (xstart, ystart, zstart, xend, h, a, p)
% RK4 Method for differential equations.  
 % xstart, ystart, zstart depend on initial condition
 % xend sets the endpoint
 % h sets the gap
 % Run: 'for i =1:13;y(i)=Q6(0,0,1,1,.1/(2^(i-1)),2,4);end'
 % followed by: 'for i =1:13;
 % z(i)=Q6(0,0,1,1,.1/(2^(i-1)),2,5)-yexact;end'
 % to obtain the numerical solutions 
 % and the global errors.
 % Run: 'for i =1:13;h(i)=1/(i-1);end'
 % Run: 'Table3(h,y,z)' to tabulate the values.
 n = round((xend-xstart)/h);
 x = zeros(1,n+1);
 Y = zeros(1,n+1);
 Z = zeros(1,n+1);
 x(1) = xstart;
 Y(1) = ystart;
 Z(1) = zstart;
 f_z = @(z) z;
 g_xy = @(x,y) -(p^2)*((1+x)^(-a))*y;
 for i=1:n
     x(i+1) = x(i)+h;
     k_11 = f_z(Z(i));
     k_21 = g_xy(x(i),Y(i));
     k_12 = f_z(Z(i)+0.5*h*k_21);
     k_23 = g_xy((x(i)+0.5*h),Y(i)+0.5*h*k_12);
     k_14 = f_z(Z(i)+h*k_23);
     k_22 = g_xy(x(i)+0.5*h,Y(i)+0.5*h*k_11);
     k_13 = f_z(Z(i)+0.5*h*k_22);
     k_24 = g_xy((x(i)+h),Y(i)+h*k_13);
     Y(i+1) = Y(i) + (h/6)*(k_11+2*k_12+2*k_13+k_14);
     Z(i+1) = Z(i) + (h/6)*(k_21+2*k_22+2*k_23+k_24);
 end
 Youtput = Y(n+1);
 Zoutput = Z(n+1);
 return