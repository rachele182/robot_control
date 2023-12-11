function M_pinv = damped_pseudo_inverse(M, lambda_max, epsilon)
%{
===========================================================================
	This function computes the damped pseudo inverse (Lev-Marq)
---------------------------------------------------------------------------
INPUT
---------------------------------------------------------------------------
    M               [n x m]              matrix
	mu              [1 x 1]              damping coefficient
    epsilon         [1 x 1]              damping threshold 
---------------------------------------------------------------------------
OUTPUT
---------------------------------------------------------------------------
	M_pinv          [m x n]              damped pseudo-inverse
===========================================================================
%}
    
    [U, S_mat, V] = svd(M);
    
    if ~any(S_mat)
        sing_vals = zeros(size(S_mat,1),1);
    else
        sing_vals = nonzeros(S_mat);
    end

    lambda_quad = 0;
    
    if sing_vals(end) < epsilon
        lambda_quad = ( 1 - (sing_vals(end) / epsilon)^2 ) * lambda_max^2;
    end

    S = zeros(size(M));

    i = 1;
    while i <= length(sing_vals)
        S(i,i) = (sing_vals(i)) / (sing_vals(i)^2 + lambda_quad);
        i = i + 1;
    end

    M_pinv = V * S' * U';
    
end