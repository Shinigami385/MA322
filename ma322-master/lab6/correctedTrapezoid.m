function [result] = correctedTrapezoid(f, a, b)
	syms x;
	df = diff(f);
	result = (double(f(a) + f(b)) * (b - a) / 2) + (double(df(a) - df(b)) * (b - a).^2 / 12); 
end