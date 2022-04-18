function [y] = f(x)
	y = 1000000 * exp(x) + 435000 * (exp(x) - 1) / x - 1564000;