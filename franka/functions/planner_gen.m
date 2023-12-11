function k = planner_gen(F_ext, z, z_des, dz_des, int, comp, e_max, F_max, F_int_max)
%% Description
% Set the K coefficient for a variable impedance controller based on a
% desired trajectory

%% Outputs
% k             stiffness

%% Inputs
% F_ext         measured external force
% z_des         desired trajectory
% z             current position
% int, comp     booleans for the interaction and compensation phase

%% Parameters
% F_int_max     desired interaction force
% F_max         nominal disturbance forces
% e_max         maximum steady-state error

%% persistent initialization
persistent ki kc F_comp int_prec comp_prec z_int z_int_dir set_F_comp
if isempty(ki)
   ki = F_max/e_max;        % k obtained from interaction
end
if isempty(F_comp)
   F_comp = 0;              % weight to compensate
end
if isempty(kc)
      kc = F_max/e_max;     % k obtained from compensation
end
if isempty(z_int) 
    z_int = 1000;       % obstacle(or interaction) position
end
if isempty(z_int_dir) 
    z_int_dir = 0;          % prohibited direction due to the obstacle
end
if isempty(int_prec)
%     int_prec = 0; 
    int_prec = cast(0,'logical');% previous values of int
end
if isempty(comp_prec)
%     comp_prec = 0;  
    comp_prec = cast(0,'logical');% previous values od comp
end
if isempty(set_F_comp)
    set_F_comp = 1;
end
%% INTERACTION
% set ki in order to match a desired interaction force with the
% envirorment, and store interaction's position when detected
% X axes
if int == 1
    % detection of an interaction 
    if abs(F_ext-F_comp) > F_max
        if z_int == 1000                     % z_int has not been set yet
            z_int = z;
            z_int_dir = -sign(F_ext-F_comp);
            set_F_comp = 0; 
        end
    end
    % setting of ki
    if abs(F_ext-F_comp) > F_int_max 
        % if interaction force is higher than threshold
        if ki*abs(z-z_des) > F_int_max
            ktemp_x = F_int_max/abs(z-z_des);
            if ktemp_x < ki                % ki needs to be only decreased
                ki = ktemp_x;
            end
        end
    end
end

%% COMPENSATION
% set kc in order to compensate the effect of the weight of the object,
% and store it
% X axes
if comp == 1
    % compensation detection
    if z_int == 1000                     % z_int not set before
        if abs(F_ext)/kc > e_max         
            kc = abs(F_ext)/e_max;
            if set_F_comp > 0.1
                F_comp = F_ext;
            end
        end
    else 
        if z_int_dir == 1                % obstacle in above
            if z < z_int
                if abs(F_ext)/kc > e_max 
                    kc = abs(F_ext)/e_max;
                    if set_F_comp > 0.1
                        F_comp = F_ext;
                    end
                end
            end
        else                                % obstacle is below
            if z > z_int
                if abs(F_ext)/kc > e_max
                    kc = abs(F_ext)/e_max;
                    if set_F_comp > 0.1
                        F_comp = F_ext;
                    end
                end
            end
        end 
   end
end

%% reset to default values when comp or int shifts to zero
if comp==0 && comp_prec==1
    kc = F_max/e_max;
    F_comp = 0;
    set_F_comp = 0;
end
if int==0 && int_prec==1
    ki = F_max/e_max;
end

%% from int to comp and vice versa
if int==1 && int_prec==0
    if comp_prec == 1
        ki = kc;
    end
    z_int=1000;
    z_int_dir=0;
end
if comp == 1 && comp_prec==0
    if int_prec == 1
        kc = ki;
    end
    set_F_comp = 1;
end

% update to last booleans
int_prec = int;
comp_prec = comp;


%% Selection of Final Values of D-K
% default values
k = abs(F_max)/e_max;

% compensation
if comp == 1
    k = kc;
end

% both compensation and interaction are activated
% if "away" from obstacle set k = kc else ki
if int == 1
    k = ki;
    if comp == 1
        if z_int == 1000
            k = kc;                       % obstacle not reached
        else
            if z_int_dir == 1
                if z_des < z_int
                    if sign(dz_des*z_int_dir) < 0
                        k = kc;               % obstacle reached but "going away"
                    end
                end
            else
                if z_des > z_int
                    if sign(dz_des*z_int_dir) < 0
                        k = kc;               % obstacle reached but "going away"
                    end
                end
            end
        end
    else
        if z_int == 1000
            k = F_max/e_max;            % restore to default
        else
            if z_int_dir == 1
                if z_des < z_int
                    k = F_max/e_max;    % restore because "going away"
                end
            else
                if z_des > z_int
                    k = F_max/e_max;    % restore because "going away"
                end
            end
        end
    end
end

end
