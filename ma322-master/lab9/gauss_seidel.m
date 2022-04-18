function [W, X, Y] = gauss_seidel(a, b, c, d, e, f, g, x0, xn, y0, yn, px0, qx0, rx0, pxn, qxn, rxn, py0, qy0, ry0, pyn, qyn, ryn, n, tol, m_iter)
	W = ones(n+1, n+1);

	h = (xn - x0)/n;
	k = (yn - y0)/n;
	X = x0:h:xn;
	Y = y0:k:yn;

	err = 10*tol;
	m = 0;
	while(err > tol & m < m_iter)
		W_temp = W;
		for i = 1:n+1
			for j = 1:n+1
				if i == 1
					W(1, j) = (rx0(Y(j)) - px0*W(2, j)/h) / (qx0 - px0/h);
				elseif i == n+1
					W(n+1, j) = (rxn(Y(j)) + pxn*W(n, j)/h) / (qxn + pxn/h);
				elseif j == 1
					W(i, 1) = (ry0(X(i)) - py0*W(i, 2)/k) / (qy0 - py0/k);
				elseif j == n+1
					W(i, n+1) = (ryn(X(i)) + pyn*W(i, n)/k) / (qyn + pyn/k);
				else
					W(i, j) = (-W(i-1, j)*(a(X(i), Y(j))/h^2 + d(X(i), Y(j))/(2*h)) - ...
					W(i+1, j)*(a(X(i), Y(j))/h^2 + d(X(i), Y(j))/(2*h)) - ...
					W(i, j-1)*(c(X(i), Y(j))/k^2 + e(X(i), Y(j))/(2*k)) - ...
					W(i, j+1)*(c(X(i), Y(j))/k^2 + e(X(i), Y(j))/(2*k)) + ...
					g(X(i), Y(j))) / (f(X(i), Y(j)) - 2*a(X(i), Y(j))/h^2 - 2*c(X(i), Y(j))/k^2);
				end
			end
		end
		err = max(max(abs(W- W_temp)));
		m = m + 1;
	end
end