%% B è la matrice di massa nello spazio dei giunti 
function B = Mass(q)
% coder.extrinsic('evalin')
persistent l1 l2 I1 I2 m1 m2
if isempty(l1)
    l1 = evalin('base','l1');
    l2 = evalin('base','l2');
end
if isempty(m1)
    m1 = evalin('base','m1');
    m2 = evalin('base','m2');
end
if isempty(I1)
    I1 = evalin('base','I1');
    I2 = evalin('base','I2');
end

B = zeros(2,2);
B = [((l1^2)/4)*m1 + I1 + m2*(l1^2) + m2*((l2^2)/4) + m2*l1*l2*cos(q(2)) + I2, m2*((l1*l2)/2)*cos(q(2)) + ((l2^2)/4) + I2; ...
    m2*(((l1*l2)/2)*cos(q(2)) + (l2^2)/4) + I2, m2*(l2^2)/4 + I2];

end
