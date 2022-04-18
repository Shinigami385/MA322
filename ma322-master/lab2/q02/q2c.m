format short;
cd ..; bisection = @biSection; cd q02;

a = -3;
b = -2;
epsilon = 1;
tol = 1e-3;
max_iter = 1000;

[root, func_val, status, iterations, data] = bisection(@fc, a, b, epsilon, tol, max_iter)
%loglog(data(:,1), data(:,6));

a = -1;
b = 0;

[root, func_val, status, iterations, data] = bisection(@fc, a, b, epsilon, tol, max_iter)
%loglog(data(:,1), data(:,6));