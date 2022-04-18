cd ..; newton = @newtonsMethod; mn = @modifiedNewton; nn = @otherNewton; ooz = @orderOfZero; cd q5;

tol = 1e-5;
max_iter = 1000;

x = 0:0.01:1;
plot(x,fa(x));

x = 0.5;
[fixed_point, status, iterations, data] = newton(@fa, @dfa, x, tol, max_iter)

p = ooz(@fa, fixed_point, tol)

x = 0.5;
[fixed_point, status, iterations, data] = mn(@fa, @dfa, p, x, tol, max_iter)