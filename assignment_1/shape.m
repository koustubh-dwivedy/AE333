function [y, domain_start, domain_end] = shape(x, y_sign)

domain_start = -3;
domain_end = 5;
temp = 0;
if x < 0
	temp = sqrt(9 - x*x);
else
	temp = 3*sqrt(1-(x*x)/25);
end

if y_sign >= 0
	y = temp;
else
	y = -temp;
end

end