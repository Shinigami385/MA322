cd ..; cs = @cubicSpline; cd q4;

X = 0.30 : 0.02 : 0.44;
X = X';
Y = sin(X);

value = 0.3102;

syms x;
fprintf('Around %f, function approximated by part of cubic Spline,\n', value);
p(x) = cs(X, Y, x, value, false, 0)

answer = double(p(value));
e = abs(answer - sin(value));

fprintf('\nValue at %f = %f\n', value, answer);
fprintf('Error at %f = %f\n', value, e);