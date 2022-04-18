format short;
cd ..; bisection = @biSection; cd q02;

a = 0.5;
b = 1.5;
epsilon = 1;
tol = 1e-3;
max_iter = 1000;

[root, func_val, status, iterations, data] = bisection(@fa, a, b, epsilon, tol, max_iter)
%loglog(data(:,1), data(:,6));