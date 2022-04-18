function [X, Y] = forward(a, b, c, x0, xn, p1, q1, r1, p2, q2, r2, n)
	A = zeros(n+1, n+1);
	B = zeros(n+1, 1);

	h = (xn - x0)/n;
	X = x0:h:xn;

	for i = 2:n
		A(i, i-1) = 1/h^2;
		A(i, i) = -2/h^2  - double(a(X(i)))/h + double(b(X(i)));
		A(i, i+1) = 1/h^2 + double(a(X(i)))/h;
		B(i) = -double(c(X(i)));
	end

	A(1, 1) = (q1 - p1/h);
	A(1, 2) = p1/h;
	B(1) = -r1;

	A(n+1, n) = -p2/h;
	A(n+1, n+1) = p2/h + q2;
	B(n+1) = -r2;

	Y = A\B;
end