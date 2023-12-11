%% let's try to have a good jacobian
% step 1:
% syms q
% use jacobian (pos, [q,0])
%% NB!! pos comes directly from direckinematic because getpos is fucking useless
addpath ../matlab_original/utils
syms q1 q2 q3 q4 q5 q6 q7 x y z real
% assume(q1, 'real');
% assume(q2, 'real');
% assume(q3, 'real');
% assume(q4, 'real');
% assume(q5, 'real');
% assume(q6, 'real');
% assume(q7, 'real');
q = [q1 q2 q3 q4 q5 q6 q7 0]';
%assume(q,'real')
[DH_sym, Convention] = Load_Franka_DH_mod();
%assume(DH_sym,'real');
EEframe = Chain_mod( DH_sym,q,x,y,z,Convention );

%% Jacobiano di posizione
p = EEframe(1:3,4);
% Ja = jacobian(p,[q1 q2 q3 q4 q5 q6 q7])
% syms t;
% q1(t) = symfun(str2sym('q1(t)'), t);
% q2(t) = symfun(str2sym('q2(t)'), t);
% q3(t) = symfun(str2sym('q3(t)'), t);
% q4(t) = symfun(str2sym('q4(t)'), t);
% q5(t) = symfun(str2sym('q5(t)'), t);
% q6(t) = symfun(str2sym('q6(t)'), t);
% q7(t) = symfun(str2sym('q7(t)'), t); 
% 
% Ja = jacobian(p,[q1(t) q2(t) q3(t) q4(t) q5(t) q6(t) q7(t)])
% Ja_dot = diff(Ja,t)

%% Jacobiano totale, orientazione XYZ
R = EEframe(1:3,1:3);
% determinare XYZ da R
% theta = -asin(R(3,1));
% psi = atan2(R(3,2)/cos(theta), R(3,3)/cos(theta));
% phi = atan2(R(2,1)/cos(theta), R(1,1)/cos(theta));
% theta deve essere compreso in [-pi/2, pi/2]
phi = atan2(R(2,1),R(1,1));
theta = atan2(-R(3,1), sqrt(R(3,2)^2 + R(3,3)^2));
psi = atan2(R(3,2), R(3,3));
eta = [phi; theta; psi];
% eta = simplify(collect(eta));
% una volta trovati gli angoli eta si buttano in [p;eta]
pose = [p; eta];
% con jacobian si trova il jacobiano analitico totale
Ja = jacobian(pose,[q1 q2 q3 q4 q5 q6 q7]);
Ja = vpa(Ja, 10);
%Ja = simplify(collect(Ja));
% differenziando si trova in jacobiano_dot
% se funziona festone