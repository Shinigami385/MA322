format long;
cd ..; bisection = @biSection; cd q02;

a = 0.5;
b = 1.5;
epsilon = 1e-3;
delta = 1e-3;
max_iter = 1000;

[root, func_val, status] = bisection(@f, a, b, epsilon, delta, max_iter)