function [y] = ddfa(x)
	y = 2 + 4 * exp(-x) - 2 * x * exp(-x) + 4 * exp(-2 * x);
end