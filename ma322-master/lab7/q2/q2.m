clear; close all;
image_file = 'q2_%d.jpg';
image_num = 1;

syms x t;
tol = 1.0e-8;
max_iter = 100;
n_max = 500;
trai = 2;

f(t, x) = (x/t) + t*sec(x/t);
a = 0;
b = 1;
ya = 0;
h = 2^(-7);

y(t) = t*asin(t);

fprintf('\n\nRunge Kutta 4th Order method\n');

[points, values] = rungeKutta4(f, a, b, ya, (b - a) / h);
actual_values = double(y(points));
figure; plot(points, values, 'r', points, actual_values, 'b');
title('Runge Kutta 4th Order method'); xlabel('t'); ylabel('y');
legend('y = approximated funtion', 'y = original function');
saveas(gcf, sprintf(image_file, image_num)); image_num = image_num + 1;

fprintf('Max-error = %e\n', max(abs(actual_values - values)));