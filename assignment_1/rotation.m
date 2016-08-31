function [x_new, y_new] = rotation(x, y, degree)

points = [x;y];
radian = (-pi*degree/180);
rotation_mat = [cos(radian), -sin(radian); sin(radian), cos(radian)];
result = rotation_mat*points;

x_new = result(1, :);
y_new = result(2, :);

end