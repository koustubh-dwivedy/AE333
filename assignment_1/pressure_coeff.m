function [c_p] = pressure_coeff(lambda, I_mat_new, v_inf, beta_i)

v_i = v_inf*sin(beta_i') + I_mat_new*(lambda/(2*pi));
c_p = (v_i/v_inf).*(v_i/v_inf);
c_p = 1 - c_p;

end