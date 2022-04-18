function [y] = df(x)
	y = 2 .* x .* log(2) .* 2.^(x.^2) - 3 .* log(7) .* 7.^(x+1);
end