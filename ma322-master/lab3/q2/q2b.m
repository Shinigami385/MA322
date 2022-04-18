cd ..; newton = @multivariateNewton; fp = @fixedPoint; cd q2;

tol = 1e-6;
max_iter = 1000;

x = [0; 0];
[fixed_point, status, iterations, data] = newton(@fb, @Jb, x, tol, max_iter)
A = [0 -6; -4 1]
[fixed_point, status, iterations, data] = fp(@gb, A, x, tol, max_iter)