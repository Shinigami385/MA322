format short;
cd ..; newton = @newtonsMethod; cd q09;

tol = 1e-6;
max_iter = 1000;

x = -0.5;
[fixed, status, iterations, data] = newton(@f, @df, x, tol, max_iter)

x = 0.9;
[fixed, status, iterations, data] = newton(@f, @df, x, tol, max_iter)