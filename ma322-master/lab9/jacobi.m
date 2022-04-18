function [W, X, Y] = jacobi(a, b, c, d, e, f, g, x0, xn, y0, yn, px0, qx0, rx0, pxn, qxn, rxn, py0, qy0, ry0, pyn, qyn, ryn, n, tol, m_iter)
	W = ones(n+1, n+1);

	h = (xn - x0)/n;
	k = (yn - y0)/n;
	X = x0:h:xn;
	X = repmat(X', 1, n+1);
	Y = y0:k:yn;
	Y = repmat(Y, n+1, 1);

	err = 10*tol;
	m = 0;
	while(err > tol & m < m_iter)
		W_temp = W;
		
		W(1, :) = (rx0(Y(1, :)) - px0*W(2, :)/h) / (qx0 - px0/h);
		W(n+1, :) = (rxn(Y(n+1, :)) + pxn*W(n, :)/h) / (qxn + pxn/h);
		W(:, 1) = (ry0(X(:, 1)) - py0*W(:, 2)/k) / (qy0 - py0/k);
		W(:, n+1) = (ryn(X(:, n+1)) + pyn*W(:, n)/k) / (qyn + pyn/k);
		W(2:n, 2:n) = (-W(1:n-1, 2:n).*(a(X(2:n, 2:n), Y(2:n, 2:n))/h^2 + d(X(2:n, 2:n), Y(2:n, 2:n))/(2*h)) - ...
			W(3:n+1, 2:n).*(a(X(2:n, 2:n), Y(2:n, 2:n))/h^2 + d(X(2:n, 2:n), Y(2:n, 2:n))/(2*h)) - ...
			W(2:n, 1:n-1).*(c(X(2:n, 2:n), Y(2:n, 2:n))/k^2 + e(X(2:n, 2:n), Y(2:n, 2:n))/(2*k)) - ...
			W(2:n, 3:n+1).*(c(X(2:n, 2:n), Y(2:n, 2:n))/k^2 + e(X(2:n, 2:n), Y(2:n, 2:n))/(2*k)) + ...
			g(X(2:n, 2:n), Y(2:n, 2:n))) ./ (f(X(2:n, 2:n), Y(2:n, 2:n)) - 2*a(X(2:n, 2:n), Y(2:n, 2:n))/h^2 - 2*c(X(2:n, 2:n), Y(2:n, 2:n))/k^2);

		err = max(max(abs(W- W_temp)));
		m = m + 1;
	end
end