format short;
cd ..; secant = @secantMethod; cd q10;

tol = 1e-14;
max_iter = 1000;

x0 = 0;
x1 = 1;
[fixed, status, iterations, data] = secant(@f3, x0, x1, tol, max_iter)

x0 = 3;
x1 = 5;
[fixed, status, iterations, data] = secant(@f3, x0, x1, tol, max_iter)