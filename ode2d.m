function xdot = ode2d(t,x,q)
%ODEFUN Summary of this function goes here
%   Detailed explanation goes here

bwp = q(1);
bpw = q(2);
gw = q(3);
gp = q(4);

W=max([x(1), 0]);
P=max([x(2), 0]);

if W == 0
    Wdot = 0;
    Pdot = 0;
else
    Wdot = gw*W -bpw*P + bwp*W;
end

if P == 0
    Pdot = 0;
    Wdot = 0;
else
    Pdot = gp*P -bwp*W;
end


xdot = [Wdot; Pdot];


end