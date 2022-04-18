function [result] = hermiteInterpolation(X, Y0, Y1, x)
	n = size(X,2);
	H0 = 0;
	H1 = 0;
	for i = 1:n
		H0 = H0 + Y0(i) * (1 - 2*dli(X, i, X(i))*(x - X(i))) * (li(X, i, x).^2);
		H1 = H1 + Y1(i) * (x - X(i)) * (li(X, i, x)^2);

	result = H0 + H1;
end
