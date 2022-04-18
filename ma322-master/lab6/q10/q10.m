clear; cd ..; addpath(pwd); cd q10;

syms x;

p = 3;
q = 2;
f(x) = ( p^2 * sin(x)^2 + q^2 * cos(x)^2)^(1/2)
a = 0;
b = 2*pi;
n = 0;

fprintf('Using Composite Simpson Rule')

lim = 10^(-6);
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
	if rem(n, 5) == 0
		fprintf('\nn = %d, error bound = %e', n, err);
	end
	data = [data; [n, err]];
end

plot(data(:, 1), data(:, 2))
figure;
plot(data(:, 1), log(data(:, 2)))

error_bound = simpsonError(f, a, b) / n^4;

fprintf('\nNumber of sub-intervals = %d', n);
fprintf('\nCalculated value of integral = %e', value);
fprintf('\nError Bound = %e', error_bound);