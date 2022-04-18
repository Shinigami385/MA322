clear; cd ..; addpath(pwd); cd q11;

syms x;

X = 0:6:84;
Y = [124, 134, 148, 156, 147, 133, 121, 109, 99, 85, 78, 89, 104, 116, 123];
n = length(X)-1;

fprintf('Using Composite Trapezoid Rule')

value = 0;
for i = 1:n
	value = value + trapezoidRule(@func, X(i), X(i+1));
end

fprintf('\nThe length of track = %e', value);