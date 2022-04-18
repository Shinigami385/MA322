function [result] = rectangleRule(f, a, b)
	syms x;
	result = double(f(a) * (b - a)); 
end