%    begin                : November 2020
%    authors              : Rachele Nebbia Colomba, Chiara Sammarco, Giorgio Simonini
%    copyright            : Dipartimento di Ingegneria dell`Informazione (DII) Universita´ di pisa    
%    email                : rachelenebbia <at> gmail <dot> com

%%Description: Init file for placement task simulation with variable impedance controller of a 7-dof franka robot
%Here you can find all the parameters set for the simulation file .slx (and editable)

%% addpath to files and function
addpath('matlab_original');
addpath('functions');
addpath matlab_original/utils/

%% Initialize
%Virtual Mass-Damper-Spring Matrices
M = 1; % kg
k_temp = 100; 
K_init = diag([k_temp, k_temp, k_temp]);
d_temp = sqrt(k_temp*4*M);
D_init = diag([d_temp, d_temp, d_temp]);

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

e_max = 0.01;
F_max = 2; % N
ov_max = 0.1;
tsettl_max = 0.5; %sec
ts_bound = 0.05;
alpha = 0.5;
F_int_max = 5; % N
%F_weight = [0;-0.5*mass_can*g]; % N ,abs(F_weight)
a0 = 0.99;
berta = 0.98;
csi = 1;

%% Environment parameters
g = 9.81; % m/s^2 %gravity
mass = 1; %kg
mass_can = 0.5; %kg
y_can = 0.2; % m
z_table = 0+0.043; % m
k_can = 500; % N/m
k_table = 10000; %N/m
k_wall = k_table; %N/m
l_can = 0.1; % m
y_wall = -0.3; % m
z_shelf = 0.3+0.043; % m
k_shelf = k_table; %N/m

%eta_d = [0;pi/4;0];
eta_d = [0;0;pi/2];
x = 0;
y = 0;
z = -0.10;

% Sample time of planner
Ts = 0.01;

% Joint limits franka robot 
q_min = [-2.8973   -1.7628   -2.8973   -3.0718   -2.8973   -0.0175  -2.8973];
q_min = q_min + deg2rad([0 0 0 10 0 5 0]);
%        166.0031  101.0010  166.0031 -3.9992   166.0031   215.0024  166.0031
q_max = [ 2.8973    1.7628    2.8973  -0.0698    2.8973    3.7525    2.8973];
q_max = q_max - deg2rad([0 0 0 10 0 5 0]);

