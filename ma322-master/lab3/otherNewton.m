function [fixed_point, status, iterations, data] = otherNewton(f, df, ddf, x, tol, max_iter)
	data = [];
	for i = 1:max_iter
		fx = f(x);
		dfx = df(x);
		ddfx = ddf(x);
		y = x - (fx * dfx) / (dfx^2 - fx * ddfx);
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