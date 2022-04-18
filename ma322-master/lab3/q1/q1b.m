cd ..; newton = @multivariateNewton; fp = @fixedPoint; cd q1;

tol = 1e-6;
max_iter = 100;

x = [1; 1];
[fixed_point, status, iterations, data] = newton(@fb, @Jb, x, tol, max_iter)

A = [7, 3; -9, 3]
[fixed_point, status, iterations, data] = fp(@gb, A, x, tol, max_iter)