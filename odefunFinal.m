function xdot = odefun(t,x,q)
%ODEFUN Summary of this function goes here
%   Detailed explanation goes here

btw = q(1);
btl = q(2);
blw = q(3);
blt = q(4);
bwt = q(5);
bwl = q(6);

atw = q(7);
alw = q(8);
awl = q(9);

W=max([x(1), 0]);
T=max([x(2), 0]);
L=max([x(3), 0]);

if W == 0
    atw = 0;
    awl = 0;
    alw = 0;
end
if T == 0
    atw = 0;
    if L > 0
        alw = 1;
        awl = 1;
    end
end

if L == 0
    alw = 0;
    awl = 0;
    if T > 0
        atw = 1;
    end
end

Wdot = -btw*atw*T - blw*alw*L + ((bwl*awl) + bwt*(1-awl))*W;
Tdot = -blt*(1-alw)*L - bwt*(1-awl)*W;
Ldot = -btl*(1-atw)*T - bwl*awl*W;
if T == 0
    Tdot = 0;
    if L == 0
        Wdot = 0;
    end
end
if L == 0
   Ldot = 0;
end
if W == 0
    Wdot = 0;
end
xdot = [Wdot; Tdot; Ldot];
end

