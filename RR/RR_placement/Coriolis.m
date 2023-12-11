function C = Coriolis(q,q_dot)

% coder.extrinsic('evalin')
persistent a
if isempty(a)
    a = evalin('base','a');
end

C = zeros(2,2);

C = [-a*sin(q(2))*q_dot(2), -a*sin(q(2))*q_dot(1)-a*sin(q(2)*q_dot(2)); ...
    a*sin(q(2))*q_dot(1), 0];
end


