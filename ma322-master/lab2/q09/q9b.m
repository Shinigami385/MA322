format short;
cd ..; secant = @secantMethod; cd q09;

tol = 1e-14;
max_iter = 1000;

x0 = -1;
x1 = 0;
[fixed, status, iterations, data] = secant(@f, x0, x1, tol, max_iter)

x0 = 0.8;
x1 = 1;
[fixed, status, iterations, data] = secant(@f, x0, x1, tol, max_iter)