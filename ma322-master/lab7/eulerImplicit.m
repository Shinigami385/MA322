function [points, values] = eulerImplicit(f, a, b, ya, n, tol, max_iter)
	syms x t;
	h = (b - a) / n;
	points = a:h:b;
	values = zeros(1, n+1);
	values(1) = ya;

	for i = 1:n
		y = values(i);
		flag = true;
		k = max_iter;
		while flag
			values(i+1) = values(i) + h * double(f(points(i+1), y));
			if abs(values(i+1) - y) < tol | k < 0
				flag = false;
			end
			y = values(i+1);
			k = k - 1;
		end
	end
end
