function [fixed, status, iterations, data] = newtonMethod(f, df, x, epsilon, max_iter)
	data = [];
    fprintf('%2s %15s %15s \n','n','x(n)','f(x(n))');
	for i = 1:max_iter
		y = x - f(x)/df(x);
		err = abs(x-y);
		temp = [i, x, y];
		data = [data; temp];
		if(abs(x - y) < epsilon)
			break;
		end
		x = y;
        fprintf('%2d %15f %15f \n',i,x,f(x));
	end
    
	fixed = y;
	iterations = i;
    fprintf('%2d %15f %15f \n',iterations,fixed,f(fixed));
end