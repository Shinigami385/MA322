format short;
cd ..; newton = @newtonsMethod; cd q07;

x = 0.5;
tol = 1e-5;
max_iter = 1000;

[fixed, status, iterations, data] = newton(@f3, @df3, x, tol, max_iter)

x = 4;

[fixed, status, iterations, data] = newton(@f3, @df3, x, tol, max_iter)