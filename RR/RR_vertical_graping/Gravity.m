function G = Gravity(q)
% coder.extrinsic('evalin')
persistent l1 g l2 m1 m2
if isempty(g)
    g = evalin('base','g');
end
if isempty(l1)
    l1 = evalin('base','l1');
    l2 = evalin('base','l2');
end

if isempty(m1)
    m1 = evalin('base','m1');
    m2 = evalin('base','m2');
end

G = zeros(2,1);
G = [-(l1/2)*cos(q(1))*m1*g - m2*g*(l1*cos(q(1))+(l2/2)*cos(q(1)+q(2))); ...
     -m2*g*(l2/2)*cos(q(1)+q(2))];

end
