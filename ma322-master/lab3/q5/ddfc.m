function [y] = ddfc(x)
	y = 6 * x - 6 * 2^(-x) + 12 * x * 2^(-x) * log(2) - 3 * x^2 * 2^(-x) * log(2)^2 - 6 * 4^(-x) * log(4) + 3 * x * 4^(-x) * log(4)^2 - 8^(-x) * log(8)^2;
end