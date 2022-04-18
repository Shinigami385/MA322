cd ..; hi = @hermiteInterpolation; addpath(pwd); cd q1;

X = [-1, -0.5, 0, 0.5];
Y0 = log(exp(X) + 2);
Y1 = exp(X) ./ (exp(X) + 2);

syms x;
value = 0.25;
fprintf('Function approximated by polynomial,\n');
p(x) = hi(X, Y0, Y1, x)
answer = double(p(value));
e = abs(log(exp(value) + 2) - answer);

fprintf('\nf(0.25) = %f\n', answer);
fprintf('Error at 0.25 = %e\n', e);