clear; cd ..; addpath(pwd); cd q2;

syms x;

f(x) = 2 / (x - 4)
a = 0;
b = 0.5;

value = rectangleRule(f, a, b);

IF = int(f);
actual_value = double(IF(b) - IF(a));

error_bound = rectangleError(f, a, b);

fprintf('\nCalculated value of integral = %e', value);
fprintf('\nActual value of integral = %e', actual_value);
fprintf('\nError Bound = %e', error_bound);
fprintf('\nError = %e\n', abs(actual_value - value));