function [y] = fc(x)
	y = x.^3 - 3 .* x.^2 .* 2.^(-x) + 3 .* x .* 4.^(-x) - 8.^(-x);
end