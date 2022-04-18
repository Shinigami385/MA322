clear; cd ..; addpath(pwd); cd q7;

syms x;

f(x) = 4 / (x.^2 + 1)
a = 0;
b = 1;
n = 0;

IF = int(f);
actual_value = double(IF(b) - IF(a));

fprintf('Using Composite Simpson Rule')

lim = 10^(-5) / 2;
err = 1;
data = [];
while err > lim
	n = n + 1;
	h = (b - a) / n;
	points = a : h : b;

	value = 0;
	for i = 1:n
		value = value + simpsonRule(f, points(i), points(i+1));
	end
	err = simpsonError(f, a, b) / n^4;
	fprintf('\nn = %d, error bound = %e', n, err);
	data = [data; [n, err]];
end

plot(data(:, 1), data(:, 2));
figure;
plot(data(:, 1), log(data(:, 2)));

error_bound = simpsonError(f, a, b) / n^4;

fprintf('\nNumber of sub-intervals = %d', n);
fprintf('\nCalculated value of integral = %e', value);
fprintf('\nActual value of integral = %e', actual_value);
fprintf('\nError Bound = %e', error_bound);
fprintf('\nError = %e\n\n', abs(actual_value - value));