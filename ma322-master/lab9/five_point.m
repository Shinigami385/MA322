function [W, X, Y] = five_point(a, b, c, d, e, f, g, x0, xn, y0, yn, px0, qx0, rx0, pxn, qxn, rxn, py0, qy0, ry0, pyn, qyn, ryn, n)
	W = zeros(n+1, n+1);
	A = zeros((n+1)^2, (n+1)^2);
	B = zeros((n+1)^2, 1);

	h = (xn - x0)/n;
	k = (yn - y0)/n;
	X = x0:h:xn;
	Y = y0:k:yn;

	for i = 2:n
		for j = 2:n
			m = (n+1)*(j-1) + i;
			A(m, m - 1) = a(X(i), Y(j))/h^2 + d(X(i), Y(j))/(2*h);
			A(m, m + 1) = a(X(i), Y(j))/h^2 + d(X(i), Y(j))/(2*h);
			A(m, m-n-1) = c(X(i), Y(j))/k^2 + e(X(i), Y(j))/(2*k);
			A(m, m+n+1) = c(X(i), Y(j))/k^2 + e(X(i), Y(j))/(2*k);
			A(m, m) = f(X(i), Y(j)) - 2*a(X(i), Y(j))/h^2 - 2*c(X(i), Y(j))/k^2;
			B(m) = g(X(i), Y(j));
		end
	end

	for i = 1:n+1
		j = 1;
		m = (n+1)*(j-1) + i;
		A(m, m+n+1) = py0/k;
		A(m, m) = qy0 - py0/k;
		B(m) = ry0(X(i));

		j = n+1;
		m = (n+1)*(j-1) + i;
		A(m, m-n-1) = pyn/k;
		A(m, m) = qyn + pyn/k;
		B(m) = ryn(X(i));
	end

	for j = 1:n+1
		i = 1;
		m = (n+1)*(j-1) + i;
		A(m, m+1) = px0/h;
		A(m, m) = qx0 - px0/h;
		B(m) = rx0(Y(j));

		i = n+1;
		m = (n+1)*(j-1) + i;
		A(m, m-1) = -pxn/h;
		A(m, m) = qxn + pxn/h;
		B(m) = rxn(Y(j));
	end

	res = A\B;
	W = reshape(res, n+1, n+1);
end