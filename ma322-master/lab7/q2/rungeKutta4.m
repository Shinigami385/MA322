function [points, values] = rungeKutta4(f, a, b, ya, n)
	syms x t;
	h = (b - a) / n;
	points = a:h:b;
	values = zeros(1, n+1);
	values(1) = ya;

	for i = 1:n
		if points(i) == 0 & values(i) == 0
			k1 = 0;
		else
			k1 = double(f(points(i), values(i)));
		end
		k2 = double(f(points(i) + h/2, values(i) + k1*h/2));
		k3 = double(f(points(i) + h/2, values(i) + k2*h/2));
		k4 = double(f(points(i) + h, values(i) + k3*h));
		values(i+1) = values(i) + (h/6) * (k1 + 2*k2 + 2*k3 + k4);
	end
end
