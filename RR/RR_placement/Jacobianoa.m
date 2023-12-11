function Ja = Jacobianoa(q)
% coder.extrinsic('evalin')
%% Description: Compute analytic Jacobian of planar RR robot to map from joint space to task space

% Outputs:   Ja = analytic Jacobian [2x2]
% Inputs:    q = joint angles [2x1], rad
%parameters: l1,l2,m1,m2 = links dimension and masses , kg*m^2
% coder.extrinsic('evalin')
persistent l1 l2 
if isempty(l1)
    l1 = 1;
    l2 = 1;
    l1 = evalin('base','l1');
    l2 = evalin('base','l2');
end

Ja = zeros(2,2);

Ja = [-l1*sin(q(1)) - l2*sin(q(1)+q(2)), -l2*sin(q(1)+q(2)); ...
    l1*cos(q(1)) + l2*cos(q(1)+q(2)), l2*cos(q(1)+q(2))];



end

