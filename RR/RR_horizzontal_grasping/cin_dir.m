function z = cin_dir(q)
% coder.extrinsic('evalin')
persistent l1 l2 

if isempty(l1)
    l1 = evalin('base','l1');
    l2 = evalin('base','l2');
end
z = zeros(2,1);

z(1) = l1*cos(q(1)) + l2*cos(q(1)+q(2));
z(2) = l1*sin(q(1)) + l2*sin(q(1)+q(2));

end

