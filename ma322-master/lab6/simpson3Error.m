function [result] = simpson3Error(f, a, b)
	syms x;
	df = diff(f, 4);
	ddf = diff(df);
	if diff(ddf) ~= 0
		val = double(solve(ddf, x));
		% val = val((val <= b) & (val >= a));
		result = 0;

		for k = 1:size(val, 1)
			if ((val(k) >= a) & (val(k) <= b))
				result = max(result, abs(double(df(val(k)))) );
			end
		end

		result = max(result, abs(double(df(a))) );
		result = max(result, abs(double(df(b))) );
	else
		result = double(df(b));
	end
	result = (result * 3 * (b - a).^5 )/ 80;
end