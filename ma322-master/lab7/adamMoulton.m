function [points, values] = adamMoulton(f, a, b, ya, n, tol, max_iter)
	syms x t;
	h = (b - a) / n;
	points = a:h:b;
	values = zeros(1, n+1);
	values(1:3) = ya;

	for i = 3:n
		y = values(i);
		flag = true;
		k = max_iter;
		while flag
			values(i+1) = values(i) + (h/24) * double(9*f(points(i+1), y) ...
				+ 19*f(points(i), values(i)) ...
				- 5*f(points(i-1), values(i-1)) ...
				+ f(points(i-2), values(i-2)));
			
			if abs(values(i+1) - y) < tol | k < 0
				flag = false;
			end
			y = values(i+1);
			k = k - 1;
		end
	end
end
