function [result] = midpointRule(f, a, b)
	syms x;
	result = double(f((a + b)/2) * (b - a)); 
end