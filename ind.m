function ind(n1,n2,val)
% ind.m:
% Adds stamp for inductor to the global G-Matrix & C-Matrix in circuit representation!
% ELEC4506, Lab-2
% Author: Nathan Lavoy
% Date: October 3rd, 2018
%--------------------------------------------------------------------------
% define global variables
global G C b;
d = size(G,1);
xr = d+1;
G(xr,xr) = 0;
C(xr,xr) = 0;
b(xr) = 0; % add new row

if (n1 ~= 0)
    G(n1,xr) = 1;
    G(xr,n1) = 1;
end

if (n2 ~= 0)
    G(n2,xr) = -1;
    G(xr,n2) = -1;
end
C(xr,xr) = -1*val;
end
%END
