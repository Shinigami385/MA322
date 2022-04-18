function [fixed, status, iterations, data] = secantMethod(f, x0, x1, epsilon, max_iter)
	data = [];
	fx1 = f(x1);
	fx0 = f(x0);
	for i = 1:max_iter
		y = x1 - fx1 * (x1 - x0) / (fx1 - fx0);
		err = abs(x0-x1);
		temp = [i, x0, x1];
		data = [data; temp];
		if(abs(x1 - y) < epsilon)
			break;
		end
		fx0 = fx1;
		fx1 = f(y);
		x0 = x1;
		x1 = y;
	end

	fixed = y;
	iterations = i;

	if(abs(x1 - y) < epsilon)
		status = 0;
	else
		status = 1;
end