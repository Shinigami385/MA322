clear; cd ..; addpath(pwd); cd q3; close all;
image_file = 'q3_%d.jpg';
image_num = 1;

syms x t;
tol = 1.0e-8;
max_iter = 100;
n_max = 500;
trai = 2;

k = 6.22 * 1.0e-19;
n1 = 2 * 1.0e3;
n2 = n1;
n3 = 3 * 1.0e3;

f(t, x) = k*(n1 - x/2)^2 * (n2 - x/2)^2 * (n3 - 3*x/4)^3;
a = 0;
b = 0.2;
ya = 0;
h = 1.0e-3;

fprintf('\n\nRunge Kutta 4th Order method\n');

[points, values] = rungeKutta4(f, a, b, ya, (b - a) / h);
figure; plot(points, values);
title('Runge Kutta 4th Order method'); xlabel('t'); ylabel('y');
legend('y = approximated funtion');
saveas(gcf, sprintf(image_file, image_num)); image_num = image_num + 1;

fprintf('\nAfter %f seconds amount of KOH formed = %e\n', points(end), values(end));