function Ja_dot = Jacobianoa_dot(q,q_dot)
% coder.extrinsic('evalin')
persistent l1 l2 

if isempty(l1)
    l1 = evalin('base','l1');
    l2 = evalin('base','l2');
end
Ja_dot = zeros(2,2);
Ja_dot = [-l1*cos(q(1))*q_dot(1) - l2*cos(q(1)+q(2))*(q_dot(1)+q_dot(2)), -l2*cos(q(1)+q(2))*(q_dot(1)+q_dot(2));...
    -l1*sin(q(1))*q_dot(1) - l2*sin(q(1)+q(2))*(q_dot(1)+q_dot(2)), -l2*sin(q(1)+q(2))*(q_dot(1)+q_dot(2))];

end

