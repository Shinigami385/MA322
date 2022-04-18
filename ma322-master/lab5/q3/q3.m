cd ..; hi = @hermiteInterpolation; addpath(pwd);  cd q3;

X = [0, 3, 5, 8, 13];

Y0 = [0, 225, 383, 623, 993];
Y1 = [75, 77, 80, 74, 72];

syms x;
fprintf('Position and Speed approximated by polynomials,\n');
position(x) = hi(X, Y0, Y1, x)
speed(x) = diff(position)

t = 10.0;
fprintf('\n(a) At t = %d sec. Position = %f feets, Speed = %f feets/sec\n', t, double(position(t)), double(speed(t)));

rate = 1.46666666667;
exceeds = double(solve(speed == 55*rate));
exceeds = min(exceeds( real(exceeds) > 0 & imag(exceeds) == 0 ));

fprintf('\n(b) First time car exceeds 55 mph at time = %f sec\n', exceeds);

df(x) = diff(speed);
time = double(solve(df));
time = time( real(time) > 0 & imag(time) == 0 );
[max_speed, t] = max(double(speed(time)));

fprintf('\n(c) Maximum speed = %f feets/sec at time = %f sec\n', max_speed, time(t));