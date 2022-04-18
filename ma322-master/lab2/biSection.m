function [root, val, status, iterations, data] = biSection(f, a, b, epsilon, tol, max_iter)
	data = [];
	fa = f(a);
	fb = f(b);
	for i = 1:max_iter
		c = (a + b) / 2;
		fc = f(c);
		err = abs(c-a);
		temp = [i, a, b, c, fc];
		data = [data; temp];
		if(abs(fc) < epsilon & err < tol)
			break;
		elseif (fa*fc < 0)
			b = c;
			fb = fc;
		else
			a = c;
			fa = fc;
		end
	end

	root = c;
	val = fc;
	iterations = i;

	if(abs(fc) < epsilon & err < tol)
		status = 0;
	elseif(fc < epsilon)
		status = 1;
	else
		status = 2;
end