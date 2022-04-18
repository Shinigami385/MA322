function [result] = gaussianUniform(f, a, b, n)
	syms x;
	h = (b - a) / n;
	points = a : h : b;

	phi = 1;
	for i = 1:n+1
		phi = phi * (x - points(i));
	end

	result = 0;
	for i = 1:n+1
		li(x) = phi / (x - points(i));
		li(x) = li(x) / double(li(points(i)));
		Li(x) = int(li);
		A = Li(b) - Li(a);
		result = result + double(f(points(i)) * A);
	end
end