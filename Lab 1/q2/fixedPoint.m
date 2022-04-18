function [fixed, status, data] = fixedPoint(g, x, epsilon, max_iter)
	data = [];
    fprintf('%15s %15s %15s \n','x(n)','f(x(n))','Error');
	for i = 1:max_iter
		y = g(x);
        err=abs(x - y)/y;
        fprintf('%15s %15s %15s \n',x,f(y),err);
		if(err < epsilon | abs(f(y)) < epsilon)
			break;
		end
		x = y;
	end

	fixed = y;

	%%data

	if(abs(x - y) < epsilon)
		status = 0;
	else
		status = 1;
end