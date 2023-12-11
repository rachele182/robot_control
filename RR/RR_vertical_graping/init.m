%    begin                : November 2020
%    authors              : Rachele Nebbia Colomba, Chiara Sammarco, Giorgio Simonini
%    copyright            : Dipartimento di Ingegneria dell`Informazione (DII) Universita´ di pisa    
%    email                : rachelenebbia <at> gmail <dot> com

%%Description: Init file for grasping task simulation of a planar RR robot
%Here you can find all the parameters set for the simulation file .slx (and editable)


%% Requirements:
%here are the requirements of response in terms of settling time, overshoot and steady-state error
% d             [N*s\m] damping factor
% k:            [Nm]    stiffnes factor
% e_max:        [m]     upper bound for steady-state displacement error
% F_max:        [N]     upper bound for external disturbance
% ov_max:       [ad]    upper bound for overshoot
% tsettl_max:   [s]     max assestement time 
% ts_bound:     [ad]    bandwidth at max assestement time
% alpha:        [0-1]   parameter used to modulate linearly between critically damped system and max overshoot t
% F_int_max     [Nm]    upper bound for max intraction force 

%% Parameters:
% M:            [kg]    mass of the MDS virtual system 
%mass_can       [kg]    mass of the object 
% F_weight:     [N]     object weight 
% a0:                   arbitrarly decreasing factor
% berta:                parameter to gaurantee condition
% csi:                  dammping factor


g = 9.81; % m/s^2
e_max = 0.01;
F_max = [2;2]; % N
ov_max = 0.1;
tsettl_max = 0.5; %sec
ts_bound = 0.05;
alpha = 0.5;
M = 0.1; % kg
mass = 0.1; %kg
mass_can = 0.5; %kg

F_int_max = [2;2]; % N
F_weight = [0;-0.5*mass_can*g]; % N ,abs(F_weight)

a0 = 0.99;
berta = 0.98;
csi = 1;

%% RR parameters
l1 = 1; %m
l2 = 1; %m
I1 = 1; %kg*m^2
I2 = 1; %kg*m^2
Ic = mass_can*l2^2; % kg*m^2
m1 = 1; %kg
m2 = 1; %kg
g = 9.81; %m/s^2

a = m2*(l1*l2)/2;
ac = mass_can*(l1*l2);

%% positions task 3
x_can = 0.5; % m
y_table = 0; % m
k_can = 500; % N/m
k_table = 10000; %N/m
k_wall = k_table;
l_can = 0.1; % m
x_wall = 1.5; % m
y_shelf = 0.5; % m
k_shelf = k_table;

% Sample time of planner
Ts = -1;

%% Fixed impedance
% case 1) high stiffness to track
K_high = [F_max(1)/e_max 0; 0 (mass_can*g)/e_max];
D_high = [sqrt(4*M*K_high(1,1)) 0; 0 sqrt(4*M*K_high(2,2))];
%case 2) low impedance to limit the interaction forces 
K_low = [20 0; 0 20];
D_low = [sqrt(4*M*K_low(1,1)) 0; 0 sqrt(4*M*K_low(2,2))];
