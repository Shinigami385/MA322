function [result] = newtonBackwardDifference(x, y, value)
	n = length(x);
	m = length(value);
	fd = zeros(n, n);
	df = ones(m, n);

	h = x(2) - x(1);

	for i = 2:n
		df(:, i) = df(:, i-1) .* (value - x(n-i+2)) / (h * (i-1));
	end

	fd(1,:) = y;
	for i = 2:n
		fd(i, i:n) = fd(i-1, i:n) - fd(i-1, i-1:n-1);
	end

	result = df * fd(:,n);
end