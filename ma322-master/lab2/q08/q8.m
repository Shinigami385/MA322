format short;
cd ..; newton = @newtonsMethod; cd q08;

tol = 1e-16;
max_iter = 1000;

a = -3:0.01:4;
plot(a,f(a));

x = -1;
[fixed, status, iterations, data] = newton(@f, @df, x, tol, max_iter)

x = 4;
[fixed, status, iterations, data] = newton(@f, @df, x, tol, max_iter)