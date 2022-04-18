function [points, values] = eulerExplicit(f, a, b, ya, n)
	syms x t;
	h = (b - a) / n;
	points = a:h:b;
	values = zeros(1, n+1);
	values(1) = ya;

	for i = 1:n
		values(i+1) = values(i) + h * double(f(points(i), values(i)));
	end
end
