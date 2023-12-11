%% Initialization
addpath('matlab_original');
addpath('functions');
addpath matlab_original/utils/
M = 1; % kg

k_temp = 100;
K_init = diag([k_temp, k_temp, k_temp]);
d_temp = sqrt(k_temp*4*M);
D_init = diag([d_temp, d_temp, d_temp]);

%% init come together
g = 9.81; % m/s^2
e_max = 0.01;
F_max = 2; % N
ov_max = 0.1;
tsettl_max = 0.5; %sec
ts_bound = 0.05;
alpha = 0.5;

mass = 1; %kg
mass_can = 0.5; %kg

F_int_max = 5; % N
%F_weight = [0;-0.5*mass_can*g]; % N ,abs(F_weight)

a0 = 0.99;
berta = 0.98;
csi = 1;

%% positions task 3
y_can = 0.2; % m
z_table = 0+0.043; % m
k_can = 500; % N/m
k_table = 10000; %N/m
k_wall = k_table;
l_can = 0.1; % m
y_wall = -0.3; % m
z_shelf = 0.3+0.043; % m
k_shelf = k_table;

% Sample time of planner
Ts = 0.01;

% franka
q_min = [-2.8973   -1.7628   -2.8973   -3.0718   -2.8973   -0.0175  -2.8973];
q_min = q_min + deg2rad([0 0 0 10 0 5 0]);
%        166.0031  101.0010  166.0031 -3.9992   166.0031   215.0024  166.0031
q_max = [ 2.8973    1.7628    2.8973  -0.0698    2.8973    3.7525    2.8973];
q_max = q_max - deg2rad([0 0 0 10 0 5 0]);

%eta_d = [0;pi/4;0];
eta_d = [0;0;pi/2];
x = 0;
y = 0;
z = -0.10;