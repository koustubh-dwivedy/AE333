angle_of_attack = 0;
v_inf = 15;
num_panels = 38;

[x_vals_start, y_vals_start, x_vals_centre, y_vals_centre, x_vals_end, y_vals_end] = panels(num_panels);

[x_vals_start, y_vals_start] = rotation(x_vals_start, y_vals_start, angle_of_attack);
[x_vals_centre, y_vals_centre] = rotation(x_vals_centre, y_vals_centre, angle_of_attack);
[x_vals_end, y_vals_end] = rotation(x_vals_end, y_vals_end, angle_of_attack);

beta_i = panel_normals(x_vals_start, y_vals_start, x_vals_centre, y_vals_centre, x_vals_end, y_vals_end);

plot(x_vals_centre, y_vals_centre);
axis equal;

I_mat = I_matrix(num_panels, x_vals_start, y_vals_start, x_vals_centre, y_vals_centre, x_vals_end, y_vals_end);

lambda = solver(v_inf, beta_i, I_mat);
%for checking accuracy of solution->
sum(lambda.*(sqrt((x_vals_end' - x_vals_start').*(x_vals_end' - x_vals_start') + (y_vals_end' - y_vals_start').*(y_vals_end' - y_vals_start'))))