function [points, values] = rungeKutta2optimal(f, a, b, ya, n)
	syms x t;
	h = (b - a) / n;
	points = a:h:b;
	values = zeros(1, n+1);
	values(1) = ya;

	for i = 1:n
		k1 = double(f(points(i), values(i)));
		k2 = double(f(points(i) + 2*h/3, values(i) + k1*2*h/3));
		values(i+1) = values(i) + (h/4) * (k1 + 3*k2);
	end
end
