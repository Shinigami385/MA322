cd ..; cs = @cubicSpline; cd q5;

X = [0.1; 0.2; 0.3; 0.4];
syms x;
f(x) = x.*cos(x) - 2*x.^2 + 3.*x - 1;
df(x) = diff(f);
Y = double(f(X));
Y1 = double(df([X(1); X(4)]));


value = 0.2013;

fprintf('Around %f, function approximated by part of cubic Spline,\n', value);
p(x) = cs(X, Y, x, value, true, Y1)

answer = double(p(value));

e = abs(answer - double(f(value)));

fprintf('\nValue of f at %f = %f\n', value, answer);
fprintf('Error at %f = %e\n', value, e);