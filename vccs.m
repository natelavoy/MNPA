function vccs(nd1,nd2,ni1,ni2,val)
% vcvs.m
% ELEC4506, Lab-2
% Author: Nathan Lavoy
% Date: October 3
%--------------------------------------------------------------------------
% define global variables
global G;


if (nd1 ~= 0)
    G(nd1,ni1) = val;
    G(nd1,ni2) = -1*val;
end
if (nd2 ~= 0)
    G(nd2,ni1) = val;
    G(nd2,ni2) = -1*val;
end

%END
