cd ..; hi = @hermiteInterpolation; addpath(pwd); cd q2;

X = [0.1, 0.2, 0.3, 0.4];
syms x;
f(x) = x.*cos(x) - 2*x.^2 + 3.*x - 1;
df(x) = diff(f);

Y0 = double(f(X));
Y1 = double(df(X));

value = 0.2013;
fprintf('Function approximated by polynomial,\n');
p(x) = hi(X, Y0, Y1, x)
answer = double(p(value));

e = abs(answer - double(f(value)));

fprintf('\nValue of f at %f = %f\n', value, answer);
fprintf('Error at %f = %e\n', value, e);