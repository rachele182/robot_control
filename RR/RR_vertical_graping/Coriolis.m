function C = Coriolis(q,q_dot)
%% Description: Compute Coriolis Matrix of planar RR robot

% Outputs:   C = Coriol Matrix [2x2]
% Inputs:    q = joint angles [2x1], rad
%            q_dot = joint velocities [2x1], rad/s
%parameters: a = moment of inertia , kg*m^2
% coder.extrinsic('evalin')
persistent a
if isempty(a)
    a = evalin('base','a');
end

C = zeros(2,2);

C = [-a*sin(q(2))*q_dot(2), -a*sin(q(2))*q_dot(1)-a*sin(q(2)*q_dot(2)); ...
    a*sin(q(2))*q_dot(1), 0];
end


