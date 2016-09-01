function [beta_i] = panel_normals(x_vals_start, y_vals_start, x_vals_centre, y_vals_centre, x_vals_end, y_vals_end)

num_panels = length(x_vals_start);
beta_i = zeros(1, num_panels);
for i = 1:num_panels
    beta_i(1, i) = atan2((y_vals_end(1, i) - y_vals_start(1, i)), (x_vals_end(1, i) - x_vals_start(1, i))) + pi/2;
end

end