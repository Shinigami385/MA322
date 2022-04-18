function [y] = fa(x)
	y = x.^2 - 2 * x .* exp(-x) + exp(-2 * x);
end