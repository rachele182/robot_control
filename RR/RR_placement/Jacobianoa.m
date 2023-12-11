function Ja = Jacobianoa(q)

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

