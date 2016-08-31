function [I_mat] = I_matrix(num_panels, x_vals_start, y_vals_start, x_vals_centre, y_vals_centre, x_vals_end, y_vals_end)

I_mat = zeros(num_panels, num_panels);


end

function [A_val] = A(x_i, x_j, y_i, y_j, fi_j)
A_val = -(x_i - x_j)*cos(fi_j) - (y_i - y_j)*sin(fi_j);
end

function [B_val] = B(x_i, x_j, y_i, y_j)
B_val = (x_i - x_j)*(x_i - x_j) + (y_i - y_j)*(y_i - y_j);
end

function [C_val] = C(fi_i, fi_j)
C_val = sin(fi_i - fi_j);
end

function [D_val] = D(x_i, x_j, y_i, y_j fi_i)
D_val = (y_i - y_j)*cos(fi_i) - (x_i - x_j)*sin(fi_i);
end

function [E_val] = E(x_i, x_j, y_i, y_j, fi_j)
E_val = (x_i - x_j)*sin(fi_j) - (y_i - y_j)*cos(fi_j);
end

function [S_j_val] = S_j(x_j_1, x_j, y_j_1, y_j)
S_j_val = sqrt((x_j_1 - x_j)*(x_j_1 - x_j) + (y_j_1 - y_j)*(y_j_1 - y_j));
end