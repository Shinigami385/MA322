function [fixed_point, status, iterations, data] = multivariateNewton(f, J, x, tol, max_iter)
	data = [];
	for i = 1:max_iter
		fx = f(x);
		y = x - J(x)\fx;
		err = max(abs(x-y));
		temp = [i, x', y', fx'];
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