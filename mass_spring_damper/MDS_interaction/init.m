%    begin                : November 2020
%    authors              : Rachele Nebbia Colomba, Chiara Sammarco, Giorgio Simonini
%    copyright            : Dipartimento di Ingegneria dell`Informazione (DII) Universita´ di pisa    
%    email                : rachelenebbia <at> gmail <dot> com

%%Description: Init file for grasping task simulation of a mass-damper-spring system
%Here you can find all the parameters set for the two simulation files .slx (and editable)
l1 = 1; %m
l2 = 1; %m
I1 = 1; %kg*m^2
I2 = 1; %kg*m^2
m1 = 1; %kg
m2 = 1; %kg
g = 9.81; %m/s^2

a = m2*(l1*l2)/2;

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
% M:            [kg]    mass of the MDS system 
% F_weight:     [N]     object weight 
% alpha:                   arbitrarly decreasing factor

e_max = 0.01;
F_max = [4;4]; % N
ov_max = 0.1;
tsettl_max = 0.5; %sec
ts_bound = 0.05;
alpha = 0.5;
M = 1; % kg
mass = 1; %kg
F_int_max = [5;5]; % N
disp ('Loaded')