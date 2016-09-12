function [c_l, c_d] = lift_drag_coeff(beta_i, c_p_i, b, x_vals_start, y_vals_start, x_vals_end, y_vals_end)

	c_l = 0;
	c_d = 0;
	for i = 1:length(x_vals_end)
		c_l = c_l + c_p_i(i)*sin(beta_i(i))*(sqrt((x_vals_start(i) - x_vals_end(i))*(x_vals_start(i) - x_vals_end(i)) + (y_vals_start(i) - y_vals_end(i))*(y_vals_start(i) - y_vals_end(i))));
		c_d = c_d + c_p_i(i)*cos(beta_i(i))*(sqrt((x_vals_start(i) - x_vals_end(i))*(x_vals_start(i) - x_vals_end(i)) + (y_vals_start(i) - y_vals_end(i))*(y_vals_start(i) - y_vals_end(i))));
	end
	c_l = +c_l/b;
	c_d = +c_d/b;

end