function [y] = fb(x)
	y = [0; 0];
	e = exp(1);
	y(1) = sin(4 * pi * x(1) * x(2)) - 2 * x(2) - x(1);
	y(2) = ((4 * pi - 1) / (4 * pi)) * (exp(2 * x(1)) - e) + 4 * e * x(2)^2 - 2 * e * x(1);
end