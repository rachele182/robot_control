%% init come together

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
K_high = [F_max(1)/e_max 0; 0 (mass_can*g)/e_max];
D_high = [sqrt(4*M*K_high(1,1)) 0; 0 sqrt(4*M*K_high(2,2))];

K_low = [20 0; 0 20];
D_low = [sqrt(4*M*K_low(1,1)) 0; 0 sqrt(4*M*K_low(2,2))];
