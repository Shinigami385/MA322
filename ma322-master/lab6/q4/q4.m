clear; cd ..; addpath(pwd); cd q4;

syms x;

f(x) = 4 / (1 + x.^2)
a = 0.5;
b = 1;

IF = int(f);
actual_value = double(IF(b) - IF(a));

fprintf('Using Mid-point Rule')
value = midpointRule(f, a, b);
error_bound = midpointError(f, a, b);

fprintf('\nCalculated value of integral = %e', value);
fprintf('\nActual value of integral = %e', actual_value);
fprintf('\nError Bound = %e', error_bound);
fprintf('\nError = %e\n\n', abs(actual_value - value));

fprintf('Using Trapezoid Rule')
value = trapezoidRule(f, a, b);
error_bound = trapezoidError(f, a, b);

fprintf('\nCalculated value of integral = %e', value);
fprintf('\nActual value of integral = %e', actual_value);
fprintf('\nError Bound = %e', error_bound);
fprintf('\nError = %e\n\n', abs(actual_value - value));

fprintf('Using Simpson one-third Rule')
value = simpsonRule(f, a, b);
error_bound = simpsonError(f, a, b);

fprintf('\nCalculated value of integral = %e', value);
fprintf('\nActual value of integral = %e', actual_value);
fprintf('\nError Bound = %e', error_bound);
fprintf('\nError = %e\n\n', abs(actual_value - value));

fprintf('Using Corrected-Trapezoid Rule')
value = correctedTrapezoid(f, a, b);
error_bound = correctedTrapezoidError(f, a, b);

fprintf('\nCalculated value of integral = %e', value);
fprintf('\nActual value of integral = %e', actual_value);
fprintf('\nError Bound = %e', error_bound);
fprintf('\nError = %e\n\n', abs(actual_value - value));

fprintf('Using Simpson three-eight Rule')
value = simpson3Rule(f, a, b);
error_bound = simpson3Error(f, a, b);

fprintf('\nCalculated value of integral = %e', value);
fprintf('\nActual value of integral = %e', actual_value);
fprintf('\nError Bound = %e', error_bound);
fprintf('\nError = %e\n\n', abs(actual_value - value));