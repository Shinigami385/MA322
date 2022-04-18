clear; cd ..; addpath(pwd); cd q1;

syms x;

f(x) = 1 / (x .* log(x))
a = exp(1) ;
b = exp(1) + 1;

value = rectangleRule(f, a, b);

IF = int(f);
actual_value = double(IF(b) - IF(a));

error_bound = rectangleError(f, a, b);

fprintf('\nCalculated value of integral = %e', value);
fprintf('\nActual value of integral = %e', actual_value);
fprintf('\nError Bound = %e', error_bound);
fprintf('\nError = %e\n', abs(actual_value - value));