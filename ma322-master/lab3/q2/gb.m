function [y] = gb(A, x)
	y = x - A\fb(x);
end