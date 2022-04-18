cd ..; newton = @multivariateNewton; fp = @fixedPoint; cd q1;

tol = 1e-6;
max_iter = 100;

x = [0; 1];
[fixed_point, status, iterations, data] = newton(@fa, @Ja, x, tol, max_iter)

A = [4, -2; 2, 3]
[fixed_point, status, iterations, data] = fp(@ga, A, x, tol, max_iter)