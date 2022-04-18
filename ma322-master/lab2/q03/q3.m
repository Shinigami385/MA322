format short;
cd ..; bisection = @biSection; cd q03;

a = -1;
b = 0.1;
epsilon = 1e-5;
delta = 1e-5;
max_iter = 1000;

[root, func_val, status, iterations, data] = bisection(@f, a, b, epsilon, delta, max_iter)
%data(:,6) = abs(data(:,4) - root);
%loglog(data(:,1), data(:,6));