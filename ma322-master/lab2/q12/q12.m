format short;
cd ..; secant = @secantMethod; cd q12;

x0 = 0.1;
x1 = 0.3;
tol = 1e-14;
max_iter = 1000;

[fixed, status, iterations, data] = secant(@f, x0, x1, tol, max_iter)