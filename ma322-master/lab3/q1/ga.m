function [y] = ga(A, x)
	y = x - A\fa(x);
end