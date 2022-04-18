function [result] = li(X, a, x)
	A = [X(1 : a-1), X(a+1 : end)];
	result = prod(x - A) ./ prod(X(a) - A);
end