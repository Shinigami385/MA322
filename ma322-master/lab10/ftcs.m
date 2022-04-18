function [W, X, T] = ftcs(c, t0, tn, x0, xn, ut0, ux0, uxn, n)
	k = (tn - t0)/n;
	lamda = 0.25;
	h = (c*k/lamda)^0.5;

	X = x0:h:xn;
	T = t0:k:tn;

	N = length(T);
	M = length(X);

	W = zeros(N, M);

	for j = 1:M
		W(1, j) = ut0(X(j));
	end

	for i = 1:N
		W(i, 1) = ux0(T(i));
		W(i, M) = uxn(T(i));
	end

	for i = 2:N
		for j = 2:M-1
			W(i, j) = lamda*(W(i-1, j-1) + W(i-1, j+1)) + (1 - 2*lamda)*W(i-1, j);
		end
	end
end