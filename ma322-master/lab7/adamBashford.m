function [points, values] = adamBashford(f, a, b, ya, n)
	syms x t;
	h = (b - a) / n;
	points = a:h:b;
	values = zeros(1, n+1);
	values(1:4) = ya;

	for i = 4:n
		values(i+1) = values(i) + (h/24) * double(55*f(points(i), values(i)) ...
			- 59*f(points(i-1), values(i-1)) ...
			+ 37*f(points(i-2), values(i-2)) ...
			- 9*f(points(i-3), values(i-3)));
	end
end
