cd ..; newton = @newtonsMethod; mn = @modifiedNewton; nn = @otherNewton; ooz = @orderOfZero; cd q5;

tol = 1e-5;
max_iter = 100;

x = 0:0.01:1;
plot(x,fc(x));

x = 0.5;
[fixed_point, status, iterations, data] = newton(@fc, @dfc, x, tol, max_iter)

p = ooz(@fc, fixed_point, tol)

x = 0.5;
[fixed_point, status, iterations, data] = nn(@fc, @dfc, @ddfc, x, tol, max_iter)