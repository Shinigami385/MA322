format short;
cd ..; bisection = @biSection; cd q01;

a = -100;
b = 100;
tol = 1e-5
delta = 1e-5;
max_iter = 1000;

[root, func_val, status, iterations, data] = bisection(@f, a, b, tol, delta, max_iter)
%loglog(data(:,1), data(:,6));