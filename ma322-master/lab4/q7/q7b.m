
X = [1, 3, -2, 4, 5];
Y = [2, 6, -1, -4, 2];

syms x
[Polynomial, Coefficients] = ndd(X, Y, x)

points = -2:0.01:5;
func_value = subs(Polynomial, x, points);

plot(points, func_value)