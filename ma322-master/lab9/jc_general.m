function [y] = jc_general(A, b, tol)
	y = zeros(size(b));
	LU = A - eye(size(A)).*A;
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