function [result] = trapezoidRule(f, a, b)
	syms x;
	result = double(f(a) + f(b)) * (b - a) / 2; 
end