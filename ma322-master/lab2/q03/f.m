function [y] = f(w)
	g = 32.17;
	x = 1.7;
	t = 1;
	y = x + (g / (2 * w^2)) * ( (exp(w*t) - exp(-w*t)) / 2 - sin(w*t) );
end