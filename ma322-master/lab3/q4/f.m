function [z] = f(x)
	y = (4 - tan(x))/(sin(x) + 3 * x^2);
	z = x^3 - 2 * x * y + y^7 - 4 * x^3 * y - 5;
end