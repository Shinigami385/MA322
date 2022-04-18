cd ..; newton = @multivariateNewton; fp = @fixedPoint; cd q3;

tol = 1e-6;
max_iter = 1000;

x = [0; 0; 0];
[fixed_point, status, iterations, data] = newton(@f, @J, x, tol, max_iter)
A = [6 0 -1; 0 9 0; 5 -2 60]
[fixed_point, status, iterations, data] = fp(@g, A, x, tol, max_iter)