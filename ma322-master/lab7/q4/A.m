clear; cd ..; addpath(pwd); cd q4; close all;
image_file = 'A_%d.jpg';
image_num = 1;

syms x t;
tol = 1.0e-10;
max_iter = 100;
n_max = 500;
trai = 2;

f(t, x) = (2 - 2*t*x) / (t^2 + 1);
a = 0;
b = 1;
ya = 1;
h = 0.1;

y(t) = (2*t + 1)/(t^2 + 1);

fprintf('\nUsing exact starting values');

fprintf('\n\nAdams-Bashford method\n');
N = [];
E = [];
n = 10;
while(n < n_max)
	N = [N, n];
	temp = a:(b-a)/n:b;
	YA = y(temp(1:4));
	[points, values] = adamBashford(f, a, b, YA, n);
	actual_values = double(y(points));
	err = max(abs(values - actual_values));
	E = [E, err];
	n = n*2;
end

triang_x = [N(trai), 2*N(trai)];
triang_y = [E(end-trai-1)/10, 2^4*E(end-trai-1)/10];
figure; loglog(N, E, 'b', triang_x([1,1,2,1]), triang_y([1,2,1,1]), 'k');
title('Adams-Bashford method'); xlabel('log(n)'); ylabel('log(error(n))');
saveas(gcf, sprintf(image_file, image_num)); image_num = image_num + 1;

O = [log2(E(1:end-1)./E(2:end)), 0];
fprintf('\nN\tError\t\tOrder')

for i = 1:length(N)-1
	fprintf('\n%d\t%e\t%f', N(i), E(i), O(i))
end

temp = a:h:b;
YA = y(temp(1:4));
[points, values] = adamBashford(f, a, b, YA, (b - a) / h);
actual_values = double(y(points));
figure; plot(points, values, 'r', points, actual_values, 'b');
title('Adams-Bashford method'); xlabel('t'); ylabel('y');
legend('y = numerically approximated funtion', 'y = original function');
saveas(gcf, sprintf(image_file, image_num)); image_num = image_num + 1;




fprintf('\n\nAdams-Moulton method\n');
N = [];
E = [];
n = 10;
while(n < n_max)
	N = [N, n];
	temp = a:(b-a)/n:b;
	YA = y(temp(1:3));
	[points, values] = adamMoulton(f, a, b, YA, n, tol, max_iter);
	actual_values = double(y(points));
	err = max(abs(values - actual_values));
	E = [E, err];
	n = n*2;
end

triang_x = [N(trai), 2*N(trai)];
triang_y = [E(end-trai-1)/10, 2^4*E(end-trai-1)/10];
figure; loglog(N, E, 'b', triang_x([1,1,2,1]), triang_y([1,2,1,1]), 'k');
title('Adams-Moulton method'); xlabel('log(n)'); ylabel('log(error(n))');
saveas(gcf, sprintf(image_file, image_num)); image_num = image_num + 1;

O = [log2(E(1:end-1)./E(2:end)), 0];
fprintf('\nN\tError\t\tOrder')

for i = 1:length(N)-1
	fprintf('\n%d\t%e\t%f', N(i), E(i), O(i))
end

temp = a:h:b;
YA = y(temp(1:3));
[points, values] = adamMoulton(f, a, b, YA, (b - a) / h, tol, max_iter);
actual_values = double(y(points));
figure; plot(points, values, 'r', points, actual_values, 'b');
title('Adams-Moulton method'); xlabel('t'); ylabel('y');
legend('y = numerically approximated funtion', 'y = original function');
saveas(gcf, sprintf(image_file, image_num)); image_num = image_num + 1;




fprintf('\nUsing starting values from Runge-Kutta 4th order');

fprintf('\n\nAdams-Bashford method\n');
N = [];
E = [];
n = 10;
while(n < n_max)
	N = [N, n];
	temp = a:(b-a)/n:b;
	[temp, YA] = rungeKutta4(f, temp(1), temp(4), ya, 3);
	[points, values] = adamBashford(f, a, b, YA, n);
	actual_values = double(y(points));
	err = max(abs(values - actual_values));
	E = [E, err];
	n = n*2;
end

triang_x = [N(trai), 2*N(trai)];
triang_y = [E(end-trai-1)/10, 2^4*E(end-trai-1)/10];
figure; loglog(N, E, 'b', triang_x([1,1,2,1]), triang_y([1,2,1,1]), 'k');
title('Adams-Bashford method'); xlabel('log(n)'); ylabel('log(error(n))');
saveas(gcf, sprintf(image_file, image_num)); image_num = image_num + 1;

O = [log2(E(1:end-1)./E(2:end)), 0];
fprintf('\nN\tError\t\tOrder')

for i = 1:length(N)-1
	fprintf('\n%d\t%e\t%f', N(i), E(i), O(i))
end

temp = a:h:b;
[temp, YA] = rungeKutta4(f, temp(1), temp(4), ya, 3);
[points, values] = adamBashford(f, a, b, YA, (b - a) / h);
actual_values = double(y(points));
figure; plot(points, values, 'r', points, actual_values, 'b');
title('Adams-Bashford method'); xlabel('t'); ylabel('y');
legend('y = numerically approximated funtion', 'y = original function');
saveas(gcf, sprintf(image_file, image_num)); image_num = image_num + 1;




fprintf('\n\nAdams-Moulton method\n');
N = [];
E = [];
n = 10;
while(n < n_max)
	N = [N, n];
	temp = a:(b-a)/n:b;
	[temp, YA] = rungeKutta4(f, temp(1), temp(3), ya, 2);
	[points, values] = adamMoulton(f, a, b, YA, n, tol, max_iter);
	actual_values = double(y(points));
	err = max(abs(values - actual_values));
	E = [E, err];
	n = n*2;
end

triang_x = [N(trai), 2*N(trai)];
triang_y = [E(end-trai-1)/10, 2^4*E(end-trai-1)/10];
figure; loglog(N, E, 'b', triang_x([1,1,2,1]), triang_y([1,2,1,1]), 'k');
title('Adams-Moulton method'); xlabel('log(n)'); ylabel('log(error(n))');
saveas(gcf, sprintf(image_file, image_num)); image_num = image_num + 1;

O = [log2(E(1:end-1)./E(2:end)), 0];
fprintf('\nN\tError\t\tOrder')

for i = 1:length(N)-1
	fprintf('\n%d\t%e\t%f', N(i), E(i), O(i))
end

temp = a:h:b;
[temp, YA] = rungeKutta4(f, temp(1), temp(3), ya, 2);
[points, values] = adamMoulton(f, a, b, YA, (b - a) / h, tol, max_iter);
actual_values = double(y(points));
figure; plot(points, values, 'r', points, actual_values, 'b');
title('Adams-Moulton method'); xlabel('t'); ylabel('y');
legend('y = numerically approximated funtion', 'y = original function');
saveas(gcf, sprintf(image_file, image_num)); image_num = image_num + 1;