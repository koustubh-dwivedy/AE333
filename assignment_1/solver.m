function [lambda] = solver(v_inf, beta_i, I_mat)
% solving AX=B
% B = -2*v_inf*cos(beta_i)
num_panels = size(I_mat, 1);
beta_i = beta_i';
B = -2*v_inf*cos(beta_i);
A = I_mat/pi + eye(num_panels);
lambda = linsolve(A, B);

end