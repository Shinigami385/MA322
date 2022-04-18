function [y] = dfc(x)
	y = 3 * x^2 - 6 * x * 2^(-x) + 3 * x^2 * 2^(-x) * log(2) + 3 * 4^(-x) - 3 * x * 4^(-x) * log(4) + 8^(-x) * log(8);
end