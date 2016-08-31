angle_of_attack = 45;

[x_vals_start, y_vals_start, x_vals_centre, y_vals_centre, x_vals_end, y_vals_end] = panels(38);

[x_vals_start, y_vals_start] = rotation(x_vals_start, y_vals_start, angle_of_attack);
[x_vals_centre, y_vals_centre] = rotation(x_vals_centre, y_vals_centre, angle_of_attack);
[x_vals_end, y_vals_end] = rotation(x_vals_end, y_vals_end, angle_of_attack);

plot(x_vals_centre, y_vals_centre);
axis equal;