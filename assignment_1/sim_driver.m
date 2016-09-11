angle_of_attack = 0;
v_inf = 15;
num_panels = 38;

[x_vals_start, y_vals_start, x_vals_centre, y_vals_centre, x_vals_end, y_vals_end] = panels(num_panels);

[x_vals_start, y_vals_start] = rotation(x_vals_start, y_vals_start, angle_of_attack);
[x_vals_centre, y_vals_centre] = rotation(x_vals_centre, y_vals_centre, angle_of_attack);
[x_vals_end, y_vals_end] = rotation(x_vals_end, y_vals_end, angle_of_attack);

beta_i = panel_normals(x_vals_start, y_vals_start, x_vals_centre, y_vals_centre, x_vals_end, y_vals_end);

plot([x_vals_start, x_vals_start(1, 1)], [y_vals_start, y_vals_start(1, 1)]);
axis equal;

I_mat = I_matrix(num_panels, x_vals_start, y_vals_start, x_vals_centre, y_vals_centre, x_vals_end, y_vals_end);

lambda = solver(v_inf, beta_i, I_mat);
%for checking accuracy of solution->
sum(lambda.*(sqrt((x_vals_end' - x_vals_start').*(x_vals_end' - x_vals_start') + (y_vals_end' - y_vals_start').*(y_vals_end' - y_vals_start'))))

I_mat_new = I_matrix_new(num_panels, x_vals_start, y_vals_start, x_vals_centre, y_vals_centre, x_vals_end, y_vals_end);
c_p_i = pressure_coeff(lambda, I_mat_new, v_inf, beta_i);

[y_dummy, domain_start, domain_end] = shape(0, 1);
[c_l, c_d] = lift_drag_coeff(beta_i, c_p_i, (domain_end - domain_start), x_vals_start, y_vals_start, x_vals_end, y_vals_end);