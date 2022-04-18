
X = [0, 1, 2, -1, 3];
Y = [-1, -1, -1, -7, 5];

syms x
[Polynomial, Coefficients] = ndd(X, Y, x)

points = -1:0.01:3;
func_value = subs(Polynomial, x, points);

plot(points, func_value)