function [result] = func(x)
	X = 0:6:84;
	Y = [124, 134, 148, 156, 147, 133, 121, 109, 99, 85, 78, 89, 104, 116, 123];
	result = Y(X == x);
end