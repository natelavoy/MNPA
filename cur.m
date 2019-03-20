function cur(n1,n2,val)
% cur.m:
% Add stamp for current source to the global circuit representation     
% ELEC4506, Lab-2
% Author: Nathan Lavoy
% Date: October 3rd, 2018
%--------------------------------------------------------------------------
% define global variables
global b;

if (n1 ~= 0)
    b(n1) = b(n1) + val;
end

if (n2 ~= 0)
    b(n2) = b(n2) - val;
end

end
%End
