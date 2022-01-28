function [T] = Table4 (x,y,z,w)
% Make a table of four variables.
 Rownumber=string(0:length(x)-1);
 x=x';y=y';z=z';w=w';
 T=table(x,y,z,w);
 T.Properties.RowNames=Rownumber';
 return

