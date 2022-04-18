format long;
cd ..; bisection = @biSection; cd q03;

a = -100;
b = 0.1;
epsilon = 1e-5;
delta = 1e-5;
max_iter = 1000;

[root, func_val, status] = bisection(@f, a, b, epsilon, delta, max_iter)