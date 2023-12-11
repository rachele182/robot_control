function [K,D,Kvis, Dvis] = planner_interp(time, kx_f, ky_f, kz_f, e_max, F_max, M, berta, a0, mass, csi)
%% Description
% Interpolate K in order to guarantee stability

%% Outputs
% K             Stiffness matrix
% D             Damping matrix

%% Inputs
% kx_f, ky, f   desired values of K

%% Parameters
% F_max         nominal disturbance forces
% e_max         maximum steady-state error
% M             virtual mass
% berta, a0     parameters for the computation of stability conditions
% mass          virtual mass

%% persistent initialization
persistent kx ky kz time_prec
if isempty(time_prec)
    time_prec = 0;              % previous simulation time
end
if isempty(kx)
   kx = F_max/e_max;         % last value of k
end
if isempty(ky)
   ky = F_max/e_max;
end
if isempty(kz)
   kz = F_max/e_max;
end

% set k from desired one 
if kx_f <= kx       
    kx = kx_f;
else 
    % increese k in accordance with the stability conditions
    kx_i = kx;
    k_dotx = berta*(4*a0*sqrt(kx_i/mass)*(kx_i)^(3/2))/(sqrt(kx_i) + 2*a0*csi*sqrt(kx_i));
    k_tempx = kx_i + k_dotx*(time -time_prec);
    if k_tempx > kx_f
        kx = kx_f;
    else
        kx = k_tempx;
    end
end

% Y axes, same as X axes
if ky_f <= ky
    ky = ky_f;
else 
    ky_i = ky;
    k_doty = berta*(4*a0*sqrt(ky_i/mass)*(ky_i)^(3/2))/(sqrt(ky_i) + 2*a0*csi*sqrt(ky_i));
    k_tempy = ky_i + k_doty*(time -time_prec);
    if k_tempy > ky_f
        ky = ky_f;
    else
        ky = k_tempy;
    end
end

% Z axes, same as other axes
if kz_f <= kz
    kz = kz_f;
else 
    kz_i = kz;
    k_dotz = berta*(4*a0*sqrt(kz_i/mass)*(kz_i)^(3/2))/(sqrt(kz_i) + 2*a0*csi*sqrt(kz_i));
    k_tempz = kz_i + k_dotz*(time -time_prec);
    if k_tempz > kz_f
        kz = kz_f;
    else
        kz = k_tempz;
    end
end

time_prec = time;

% damping computation, critically damped condition
dx = sqrt(4*kx*M);
dy = sqrt(4*ky*M);
dz = sqrt(4*kz*M);

%% Final impedance matrices
D = zeros(6,6);
K = zeros(6,6);
D(1:3,1:3) = diag([dx, dy, dz]);
D(4:6,4:6) = diag([2*sqrt(300) 2*sqrt(300) 2*sqrt(300)]); %rot damping
K(1:3,1:3) = diag([kx, ky, kz]);
K(4:6,4:6) = diag ([300 300 300]); %rot stiffness
Kvis = [kx; ky; kz];
Dvis = [dx; dy; dz];
end
