%% INIT

l1 = 1; %m
l2 = 1; %m
I1 = 1; %kg*m^2
I2 = 1; %kg*m^2
m1 = 1; %kg
m2 = 1; %kg
g = 9.81; %m/s^2

a = m2*(l1*l2)/2;

%% SPECIFICHE 
%specifiche di settling time, overshoot ed errore a regime
% d, k: coefficiente di damping e costante elastica del sistema
% e_max:        [m] errore massimo a regime
% F_max:        [N] stima del massimo disturbo in forza a regime
% ov_max:       [ad] massimo overshoot accettabile
% tsettl_max:   [s] tempo di assestamento con banda a
% ts_bound:     [ad] banda del tempo di assestamento
% alpha:        [0-1] varia linearmente da sistema criticamente smorzato a massimo overshoot
% M:            [kg] massa del sistema


e_max = 0.01;
F_max = [1;1]; % N
ov_max = 0.1;
tsettl_max = 0.5; %sec
ts_bound = 0.05;
alpha = 0.5;
M = 1; % kg
mass = 1; %kg

F_int_max = [5;5]; % N
disp('Loading parameters done') 