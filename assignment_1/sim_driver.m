c_l = zeros(50, 1);
c_d = zeros(50, 1);
for t = 0:0
    angle_of_attack = 0;
    v_inf = 15*abs(cos(t*4*pi/50)); % 2 Time Periods
    num_panels = 38;

    angle_of_attack = angle_of_attack + 90;
    [x_vals_start, y_vals_start, x_vals_centre, y_vals_centre, x_vals_end, y_vals_end] = panels(num_panels);

    [x_vals_start, y_vals_start] = rotation(x_vals_start, y_vals_start, angle_of_attack);
    [x_vals_centre, y_vals_centre] = rotation(x_vals_centre, y_vals_centre, angle_of_attack);
    [x_vals_end, y_vals_end] = rotation(x_vals_end, y_vals_end, angle_of_attack);

    beta_i = panel_normals(x_vals_start, y_vals_start, x_vals_centre, y_vals_centre, x_vals_end, y_vals_end);

%     plot([x_vals_start, x_vals_start(1, 1)], [y_vals_start, y_vals_start(1, 1)]);
%     axis equal;

    I_mat = I_matrix(num_panels, x_vals_start, y_vals_start, x_vals_centre, y_vals_centre, x_vals_end, y_vals_end);

    lambda = solver(v_inf, beta_i, I_mat);
    %for checking accuracy of solution->
%     sum(lambda.*(sqrt((x_vals_end' - x_vals_start').*(x_vals_end' - x_vals_start') + (y_vals_end' - y_vals_start').*(y_vals_end' - y_vals_start'))))

    I_mat_new = I_matrix_new(num_panels, x_vals_start, y_vals_start, x_vals_centre, y_vals_centre, x_vals_end, y_vals_end);
    c_p_i = pressure_coeff(lambda, I_mat_new, v_inf, beta_i);

    [y_dummy, domain_start, domain_end] = shape(0, 1);
    [c_l(t+1), c_d(t+1)] = lift_drag_coeff(beta_i, c_p_i, (domain_end - domain_start), x_vals_start, y_vals_start, x_vals_end, y_vals_end);
%     plot([x_vals_centre'; x_vals_centre(1)], [c_p_i', c_p_i(1)]);
end
plot([1:50], c_l);
plot([1:50], c_d);