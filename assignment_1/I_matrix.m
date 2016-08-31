function [I_mat] = I_matrix(num_panels, x_vals_start, y_vals_start, x_vals_centre, y_vals_centre, x_vals_end, y_vals_end)

I_mat = zeros(num_panels, num_panels);

for i = 1:num_panels
	for j = 1:num_panels
		if i ~= j
			x_i = x_vals_centre(i);
			x_j = x_vals_start(j);
			x_j_1 = x_vals_end(j);
			y_i = y_vals_centre(i);
			y_j = y_vals_start(j);
			y_j_1 = y_vals_end(j);
			
			fi_i = atan((y_vals_end(i) - y_vals_start(i))/(x_vals_end(i) - x_vals_start(i)));
			fi_j = atan((y_vals_end(j) - y_vals_start(j))/(x_vals_end(j) - x_vals_start(j)));

			A_val = A(x_i, x_j, y_i, y_j, fi_j);
			B_val = B(x_i, x_j, y_i, y_j);
			C_val = C(fi_i, fi_j);
			D_val = D(x_i, x_j, y_i, y_j, fi_i);
			E_val = E(x_i, x_j, y_i, y_j, fi_j);
			S_j_val = S_j(x_j_1, x_j, y_j_1, y_j);

			I_mat(i, j) = (C_val/2)*log((S_j_val*S_j_val + 2*A_val*S_j_val + B_val)/B_val) + ((D_val - A_val*C_val)/E_val)*(atan((S_j_val + A_val)/E_val) - atan(A_val/E_val));
		end
	end
end

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

function [D_val] = D(x_i, x_j, y_i, y_j, fi_i)
D_val = (y_i - y_j)*cos(fi_i) - (x_i - x_j)*sin(fi_i);
end

function [E_val] = E(x_i, x_j, y_i, y_j, fi_j)
E_val = (x_i - x_j)*sin(fi_j) - (y_i - y_j)*cos(fi_j);
end

function [S_j_val] = S_j(x_j_1, x_j, y_j_1, y_j)
S_j_val = sqrt((x_j_1 - x_j)*(x_j_1 - x_j) + (y_j_1 - y_j)*(y_j_1 - y_j));
end