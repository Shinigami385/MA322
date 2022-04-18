format short;
cd ..; secant = @secantMethod; cd q11;

x0 = 0;
x1 = 1;
tol = 1e-4;
max_iter = 1000;

[fixed, status, iterations, data] = secant(@f, x0, x1, tol, max_iter)