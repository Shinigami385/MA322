function [result] = dli(X, a, value)
	syms x;
	df(x) = diff(li(X, a, x));
	result = double(df(value));
end