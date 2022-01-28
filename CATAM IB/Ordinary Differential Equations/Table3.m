function [T] = Table3 (x,y,z)
% Make a table of three variables.
 Rownumber=string(0:length(x)-1);
 x=x';y=y';z=z';
 T=table(x,y,z);
 T.Properties.RowNames=Rownumber';
 return

