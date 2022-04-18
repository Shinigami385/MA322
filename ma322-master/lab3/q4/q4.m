cd ..; newton = @newtonsMethod; cd q4;

tol = 1e-6;
max_iter = 1000;

x = 1;
[fixed_point, status, iterations, data] = newton(@f, @df, x, tol, max_iter)

x = fixed_point
y = (4 - tan(x))/(sin(x) + 3 * x^2)