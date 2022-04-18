cd ..; newton = @newtonsMethod; mn = @modifiedNewton; nn = @otherNewton; ooz = @orderOfZero; cd q5;

tol = 1e-5;
max_iter = 100;

x = -2:0.01:-1;
plot(x,fb(x));

x = -1.5;
[fixed_point, status, iterations, data] = newton(@fb, @dfb, x, tol, max_iter)

p = ooz(@fb, fixed_point, tol)

x = -1.5;
[fixed_point, status, iterations, data] = nn(@fb, @dfb, @ddfb, x, tol, max_iter)