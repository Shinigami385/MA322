cd ..; newton = @multivariateNewton; fp = @fixedPoint; cd q2;

tol = 1e-6;
max_iter = 1000;

x = [0; 0];
[fixed_point, status, iterations, data] = newton(@fa, @Ja, x, tol, max_iter)
A = [-16, 1; 4, -4]
[fixed_point, status, iterations, data] = fp(@ga, A, x, tol, max_iter)