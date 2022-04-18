function [x] = gs_general(A, b, tol)
	y = zeros(size(b));
	U = triu(A, 0);
	L = tril(A, 1);
	D = diag(A);
	err = 10*tol;

	n = 0;
	while(err > tol & n < 1000)
		x = y;
		y = x + (b - A*x)./D;
		err = max(abs(x-y));
		n = n + 1;
	end
end