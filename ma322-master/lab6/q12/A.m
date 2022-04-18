clear; cd ..; addpath(pwd); cd q12;

syms x;

f(x) = x^2 * log(x)
a = 1;
b = 1.5;
n = [2, 3, 4, 5, 6];

IF = int(f);
actual_value = double(IF(b) - IF(a));

fprintf('Using Gaussian quadrature for uniform intervals');
fprintf('\nActual value of integral = %e', actual_value);

for j = 1:length(n)
	value = gaussianUniform(f, a, b, n(j));

	fprintf('Number of intervals, n = %d', n(j))
	fprintf('\nCalculated value of integral = %e', value);
	fprintf('\nError = %e\n\n', abs(actual_value - value));
end