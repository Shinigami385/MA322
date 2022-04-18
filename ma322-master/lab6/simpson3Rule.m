function [result] = simpson3Rule(f, a, b)
	syms x;
	result = double(f(a) + 3*f((2.*a + b)/3) + 3*f((a + 2.*b)/3) + f(b)) * (b - a) / 8; 
end