function [z] = df(x)
	y = (4 - tan(x))/(sin(x) + 3 * x^2);
	dy = (-(sin(x) + 3 * x^2) * (sec(x))^2 + (4 - tan(x)) * (cos(x) + 6 * x)) / (sin(x) + 3 * x^2)^2;
	z = 3 * x^2 - 2 * y - 2 * x * dy + 7 * y^6 * dy + 12 * x^2 * y + 4 * x^3 * dy;
end