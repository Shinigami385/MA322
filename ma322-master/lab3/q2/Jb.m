function [J] = Jb(x)
	J = [0, 0; 0, 0];
	e = exp(1);
	J(1,1) = 4 * pi * x(2) * cos(4 * pi * x(1) * x(2)) - 1;
	J(1,2) = 4 * pi * x(1) * cos(4 * pi * x(1) * x(2)) - 2;
	J(2,1) = ((4 * pi - 1) / (4 * pi)) * 2 * exp(2 * x(1)) - 2 * e;
	J(2,2) = 8 * e * x(2);
end