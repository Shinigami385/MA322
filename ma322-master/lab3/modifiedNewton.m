function [fixed_point, status, iterations, data] = modifiedNewton(f, df, p, x, tol, max_iter)
	data = [];
	for i = 1:max_iter
		y = x - p*f(x)/df(x);
		err = abs(x-y);
		temp = [i, x, y];
		data = [data; temp];
		if(err < tol)
			break;
		end
		x = y;
	end

	fixed_point = y;
	iterations = i;

	if(err < tol)
		status = 0;
	else
		status = 1;
end