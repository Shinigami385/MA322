cd ..; newton = @newtonsMethod; mn = @modifiedNewton; nn = @otherNewton; ooz = @orderOfZero; cd q5;

tol = 1e-5;
max_iter = 100;

x = -1:0.01:0;
plot(x,fd(x));

x = -0.5;
[fixed_point, status, iterations, data] = newton(@fd, @dfd, x, tol, max_iter)

p = ooz(@fd, fixed_point, tol)

x = -0.5;
[fixed_point, status, iterations, data] = nn(@fd, @dfd, @ddfd, x, tol, max_iter)