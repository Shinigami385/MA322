function [result] = lagrangeInterpolatingPolynomial(x, y, value)
	n = length(x);
	m = length(value);
	fd = zeros(n, n);
	df = ones(m, n);
	phi = ones(n, n);

	h = x(2) - x(1);

	for i = 1:n
		df(:, i) = value - x(i);
	end
	pd = prod(df, 2);

	for i = 1:n
		phi(i, :) = x(i) - x;
	end
	phi = eye(size(phi)) + phi;
	phi = prod(phi, 2);

	% fd(1,:) = y;
	% for i = 2:n
	% 	fd(i, 1: n-i+1) = (fd(i-1, 2: n-i+2) - fd(i-1, 1: n-i+1)) ./ (x(i: n) - x(1: n-i+1));
	% end
	result = bsxfun(@times, pd, y);
	result = result ./ bsxfun(@minus, value, x);
	result = bsxfun(@rdivide, result, phi');
	result = sum(result, 2);
end