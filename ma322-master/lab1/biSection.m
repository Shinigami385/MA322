function [root, val, status, data] = biSection(f, a, b, epsilon, delta, max_iter)
	data = [];
	fa = f(a);
	fb = f(b);
	for i = 1:max_iter
		c = (a + b) / 2;
		fc = f(c);
		err = abs(c-a);
		temp = [i, a, b, c, fc, err];
		data = [data; temp];
		if(abs(fc) < epsilon & err < delta)
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

	data

	if(abs(fc) < epsilon & err < delta)
		status = 0;
	elseif(fc < epsilon)
		status = 1;
	else
		status = 2;
end