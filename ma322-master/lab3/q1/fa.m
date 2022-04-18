function [y] = fa(x)
	y = [0; 0];
	y(1) = 4 * x(1)^2 - x(2)^2;
	y(2) = 4 * x(1) * x(2)^2 - x(1) - 1;
end