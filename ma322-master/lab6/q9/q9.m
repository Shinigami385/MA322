clear; cd ..; addpath(pwd); cd q9;
warning('off', 'symbolic:solve:warnmsg3')

syms x;

f(x) = x * log(x)
a = 1;
b = 2;
lim = 10^(-5);

IF = int(f);
actual_value = double(IF(b) - IF(a));

fprintf('Using Composite Trapezoid Rule')

n = 0;
err = 1;
data = [];
while err > lim
	n = n + 1;
	h = (b - a) / n;
	points = a : h : b;

	value = 0;
	for i = 1:n
		value = value + trapezoidRule(f, points(i), points(i+1));
	end
	err = trapezoidError(f, a, b) / n^2;
	if rem(n, 5) == 0
		fprintf('\nn = %d, error bound = %e, error = %e', n, err, abs(actual_value - value));
	end
	data = [data; [n, err]];
end

figure;
plot(data(:, 1), data(:, 2));
figure;
plot(data(:, 1), log(data(:, 2)));

error_bound = trapezoidError(f, a, b) / n^2;

fprintf('\nNumber of sub-intervals = %d', n);
fprintf('\nLength of sub-interval = %f', h);
fprintf('\nCalculated value of integral = %e', value);
fprintf('\nActual value of integral = %e', actual_value);
fprintf('\nError Bound = %e', error_bound);
fprintf('\nError = %e\n\n', abs(actual_value - value));


fprintf('Using Composite Simpson Rule')

n = 0;
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
		fprintf('\nn = %d, error bound = %e, error = %e', n, err, abs(actual_value - value));
	end
	data = [data; [n, err]];
end

figure;
plot(data(:, 1), data(:, 2));
figure;
plot(data(:, 1), log(data(:, 2)));

error_bound = simpsonError(f, a, b) / n^4;

fprintf('\nNumber of sub-intervals = %d', n);
fprintf('\nLength of sub-interval = %f', h);
fprintf('\nCalculated value of integral = %e', value);
fprintf('\nActual value of integral = %e', actual_value);
fprintf('\nError Bound = %e', error_bound);
fprintf('\nError = %e\n\n', abs(actual_value - value));


fprintf('Using Composite Mid-Point Rule')

n = 0;
err = 1;
data = [];
while err > lim
	n = n + 1;
	h = (b - a) / n;
	points = a : h : b;

	value = 0;
	for i = 1:n
		value = value + midpointRule(f, points(i), points(i+1));
	end
	err = midpointError(f, a, b) / n^2;
	if rem(n, 5) == 0
		fprintf('\nn = %d, error bound = %e, error = %e', n, err, abs(actual_value - value));
	end
	data = [data; [n, err]];
end

figure;
plot(data(:, 1), data(:, 2));
figure;
plot(data(:, 1), log(data(:, 2)));

error_bound = midpointError(f, a, b) / n^2;

fprintf('\nNumber of sub-intervals = %d', n);
fprintf('\nLength of sub-interval = %f', h);
fprintf('\nCalculated value of integral = %e', value);
fprintf('\nActual value of integral = %e', actual_value);
fprintf('\nError Bound = %e', error_bound);
fprintf('\nError = %e\n\n', abs(actual_value - value));