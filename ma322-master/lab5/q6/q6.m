cd ..; cs = @cubicSpline; cd q6;

X = [0, 3, 5, 8, 13]';

Y = [0, 225, 383, 623, 993]';
Y1 = [75, 72]';

syms x;

t = 10.0;
fprintf('\n(a) ');
fprintf('Around t = x =  %f, Position and Speed approximated by part of cubic Spline,\n', t);
position(x) = cs(X, Y, x, t, false, 0)
speed(x) = diff(position)

fprintf('At t = %d sec. Position = %f feets, Speed = %f feets/sec\n', t, double(position(t)), double(speed(t)));

fprintf('\n(b) ');
fprintf('Around t = x =  %f, Position and Speed approximated by part of cubic Spline,\n', t);
position(x) = cs(X, Y, x, t, true, Y1)
speed(x) = diff(position)

fprintf('At t = %d sec. Position = %f feets, Speed = %f feets/sec\n', t, double(position(t)), double(speed(t)));
