function [y] = dfa(x)
	y = 2 * x - 2 * exp(-x) + 2 * x * exp(-x) - 2 * exp(-2 * x);
end