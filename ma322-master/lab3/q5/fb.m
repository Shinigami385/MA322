function [y] = fb(x)
	y = cos(x + 2^(1/2)) + x .* (x/2 + 2^(1/2));
end