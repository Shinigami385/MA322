function [result, coeff] = newtonForwardDifference(x, y, value)
	n = length(x);
	m = length(value);
	fd = zeros(n, n);
	df = ones(m, n);

	h = x(2) - x(1);

	for i = 2:n
		df(:, i) = df(:, i-1) .* (value - x(i-1)) / (h * (i-1));
	end

	fd(1,:) = y;
	for i = 2:n
		fd(i, 1: n-i+1) = fd(i-1, 2: n-i+2) - fd(i-1, 1: n-i+1);
	end

	result = df * fd(:,1);
	coeff = fd(:,1)';
	for i = 1:n
		coeff(i) = coeff(i) ./ prod(1:i);
end