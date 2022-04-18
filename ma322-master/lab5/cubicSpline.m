function [result] = cubicSpline(X, Y, x, value, clamped, Y1)
	n = size(X, 1);
	M = zeros(n, 1);
	C = zeros(n-1, 1);
	D = zeros(n-1, 1);
	H = X(2:n) - X(1:n-1);

	A = zeros(n, n);
	b = zeros(n, 1);

	if clamped		
		fprintf('Using Clamped Cubic Spline\n')
		b(1) = (Y(2) - Y(1))/H(1) - Y1(1);
		b(n) = Y1(2) - (Y(n) - Y(n-1))/H(n-1);
		A(1, 1) = H(1)/3;
		A(1, 2) = H(1)/6;
		A(n, n-1) = H(n-1)/6;
		A(n, n) = H(n-1)/3;
	else
		fprintf('Using Natural Cubic Spline\n')
		b(1) = 0;
		b(n) = 0;
		A(1, 1) = 1;
		A(n, n) = 1;
	end

	for k = 2:n-1
		A(k, k-1) = H(k-1)/6;
		A(k, k) = (H(k-1) + H(k))/3;
		A(k, k+1) = H(k)/6;
		b(k) = (Y(k+1) - Y(k))/H(k) - (Y(k) - Y(k-1))/H(k-1);
	end

	M = A\b;
	C = Y(1:n-1)./H - H.*M(1:n-1)/6;
	D = Y(2:n)./H - H.*M(2:n)/6;

	[k, k] = max(X > value);
	k = k - 1;

	result = ((X(k+1) - x)^3 * M(k) + (x - X(k))^3 * M(k+1))/(6*H(k)) + C(k)*(X(k+1) - x) + D(k)*(x - X(k));
end