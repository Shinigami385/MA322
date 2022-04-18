format short;
cd ..; secant = @secantMethod; cd q10;

tol = 1e-14;
max_iter = 1000;

x0 = 1;
x1 = 2;
[fixed, status, iterations, data] = secant(@f2, x0, x1, tol, max_iter)

x0 = e;
x1 = 4;
[fixed, status, iterations, data] = secant(@f2, x0, x1, tol, max_iter)