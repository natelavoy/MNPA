function ccvs(nd1,nd2,ni1,ni2,val)
% define global variables
%   ni1 -------o            |----------o nd1
%              |            |
%              |           /+\
%          Ii| |          /   \    Vni1 - Vni2 = val*(Ii)
%            | |          \   /
%           \ /|           \-/ 
%              |            |
%   ni2 -------o            |----------o nd2
global G C b;
d = size(G,1); % current size of the MNA
xr1 = d+1;      % new row/column
xr2 = d+2;
b(xr1) = 0;     
b(xr2) = 0;
G(xr1,xr1) = 0; 
G(xr2,xr2) = 0;
C(xr1,xr1) = 0;
C(xr2,xr2) = 0;

if (nd1 ~= 0)
    G(nd1,xr2) = 1;
    G(xr2,nd1) = 1;
end
if (nd2 ~= 0)
    G(nd2,xr2) = -1;
    G(xr2,nd2) = -1;
end

if (ni1 ~= 0)
    G(ni1,xr1) = 1;
    G(xr1,ni1) = 1;
end
if (ni2 ~= 0)
    G(ni2,xr2) = -1;
    G(xr2,ni2) = -1;
end
G(xr2,xr1) = -val;
%END
