function [x_vals_start, y_vals_start, x_vals_centre, y_vals_centre, x_vals_end, y_vals_end] = panels(num_panels)

[y, x_domain_start, x_domain_end] = shape(0, 0);
x_domain_length = x_domain_end - x_domain_start;

num_x_division = 0;

if rem(num_panels, 2) == 0
	num_x_division = num_panels/2;
else
	num_x_division = (num_panels+1)/2;
end

x_division_length = x_domain_length/num_x_division;

x_vals_start = zeros(1, num_panels);
y_vals_start = zeros(1, num_panels);
x_vals_centre = zeros(1, num_panels);
y_vals_start = zeros(1, num_panels);
x_vals_end = zeros(1, num_panels);
y_vals_end = zeros(1, num_panels);

if rem(num_panels, 2) == 0
	for i = 1:num_panels/2
		x_vals_start(1, i) = x_domain_start + (i-1)*x_division_length;
		x_vals_end(1, i) = x_domain_start + (i)*x_division_length;
		x_vals_centre(1, i) = (x_vals_start(1, i) + x_vals_end(1, i))/2;
		y_vals_start(1, i) = shape(x_vals_start(1, i), 1);
		y_vals_centre(1, i) = shape(x_vals_centre(1, i), 1);
		y_vals_end(1, i) = shape(x_vals_end(1, i), 1);
	end
	for i = (num_panels/2 + 1):num_panels
		x_vals_start(1, i) = x_domain_end - (i - num_panels/2 - 1)*x_division_length;
		x_vals_end(1, i) = x_domain_end - (i - num_panels/2)*x_division_length;
		x_vals_centre(1, i) = (x_vals_start(1, i) + x_vals_end(1, i))/2;
		y_vals_start(1, i) = shape(x_vals_start(1, i), -1);
		y_vals_centre(1, i) = shape(x_vals_centre(1, i), -1);
		y_vals_end(1, i) = shape(x_vals_end(1, i), -1);
	end
else
	for i = 1:(ceil(num_panels/2)-1)
		x_vals_start(1, i) = x_domain_start + (i-1)*x_division_length;
		x_vals_end(1, i) = x_domain_start + (i)*x_division_length;
		x_vals_centre(1, i) = (x_vals_start(1, i) + x_vals_end(1, i))/2;
		y_vals_start(1, i) = shape(x_vals_start(1, i), 1);
		y_vals_centre(1, i) = shape(x_vals_centre(1, i), 1);
		y_vals_end(1, i) = shape(x_vals_end(1, i), 1);
	end
	
	for i = ceil(num_panels/2):ceil(num_panels/2)
		x_vals_start(1, i) = x_domain_start + (i-1)*x_division_length;
		x_vals_end(1, i) = x_vals_start(1, i);
		x_vals_centre(1, i) = x_vals_start(1, i);
		y_vals_start(1, i) = shape(x_vals_start(1, i), 1);
		y_vals_centre(1, i) = shape(x_vals_centre(1, i), 1);
		y_vals_end(1, i) = shape(x_vals_end(1, i), -1);
	end

	for i = (ceil(num_panels/2)+1):num_panels
		x_vals_start(1, i) = x_domain_start + x_division_length*(num_panels-1)/2 - (i - ceil(num_panels/2) - 1)*x_division_length;
		x_vals_end(1, i) = x_domain_start + x_division_length*(num_panels-1)/2 - (i - ceil(num_panels/2))*x_division_length;
		x_vals_centre(1, i) = (x_vals_start(1, i) + x_vals_end(1, i))/2;
		y_vals_start(1, i) = shape(x_vals_start(1, i), -1);
		y_vals_centre(1, i) = shape(x_vals_centre(1, i), -1);
		y_vals_end(1, i) = shape(x_vals_end(1, i), -1);
	end
end

end