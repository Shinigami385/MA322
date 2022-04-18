clear; cd ..; addpath(pwd); cd q8;

syms x;

X = [1, 5/4, 3/2, 7/4, 2];
Y = [10, 8, 7, 6, 5];
n = length(X)-1;

f(x) = poly2sym(polyfit(X, Y, n));

IF = int(f);
actual_value = double(IF(X(end)) - IF(X(1)));

fprintf('Using Composite Trapezoid Rule')

value = 0;
for i = 1:n
	value = value + trapezoidRule(f, X(i), X(i+1));
end

fprintf('\nCalculated value of integral = %e', value);