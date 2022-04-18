function [fixed, status, iterations, data] = fixedPoint(g, x, epsilon, max_iter)
	data = [];
	for i = 1:max_iter
		y = g(x);
		err = abs(x-y);
		temp = [i, x, y];
		data = [data; temp];
		if(abs(x - y) < epsilon)
			break;
		end
		x = y;
	end

	fixed = y;
	iterations = i;

	if(abs(x - y) < epsilon)
		status = 0;
	else
		status = 1;
end