function [result] = simpsonRule(f, a, b)
	syms x;
	result = double(f(a) + 4*f((a + b)/2) + f(b)) * (b - a) / 6; 
end