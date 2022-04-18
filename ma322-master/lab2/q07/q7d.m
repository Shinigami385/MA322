format short;
cd ..; newton = @newtonsMethod; cd q07;

tol = 1e-5;
max_iter = 1000;

x = 0.5;
[fixed, status, iterations, data] = newton(@f4, @df4, x, tol, max_iter)

x = 3.5;
[fixed, status, iterations, data] = newton(@f4, @df4, x, tol, max_iter)

x = 6.5;
[fixed, status, iterations, data] = newton(@f4, @df4, x, tol, max_iter)