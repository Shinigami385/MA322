function [y] = df1(x)
	y = exp(x) - log(2) .* 2.^(-x) - 2*sin(x);
end