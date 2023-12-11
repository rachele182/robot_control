function [d, k] = find_dk(e_max, F_max, ov_max, tsettl_max, ts_bound, alpha, M)
    %% Description: algorithm for the selection of k and d for mass-damper-spring system given these requirements
    % Output: 
    % d,k        damping and spring constant
    % Inputs:
    % e_max      maximum steady-state error
    % F_max      maximum estimated external force
    % ov_max     maximum overshoot
    % tsettl_max maximum settling time
    % ts_bound   bound of settling time
    % alpha      parameter for convex combination 
    % M          Mass
    
    
    
    % Choosing spring constant as minimum to reach steady state error requirement
    k = F_max/e_max;    % minimum k 
    fact = 1.1;         % factor to increment k
    cycle = 1;          % used to stop
    d = 0;
    
    while (cycle == 1)
        num = 4*k*M;
        den = (pi/log(ov_max))^2+1;
        d1 = sqrt(num/den);             % d for maximum overshoot response
        d2 = sqrt(num);                 % d for critically damped system
        d = alpha*d1 + (1-alpha)*d2;    % convex combination with alpha
        t_settl = -(log(ts_bound)*2*M)/d;   % settling time verification
        if t_settl > tsettl_max
            k = k*fact; 
        else   
            cycle = 0;
        end
    end
end

