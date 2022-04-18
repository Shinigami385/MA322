function [p] = orderOfZero(f, root, tol)
	p = 0;
	syms x;
	func = f(x);
	while(subs(func, x, root) < tol)
		p = p + 1;
		func = diff(func, x, 1);
	end
end