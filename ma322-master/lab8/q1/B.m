clear; cd ..; addpath(pwd); cd q1; close all;
image_file = 'B_%d.jpg';
image_num = 1;
trai = 2;

syms x;

y(x) = x^3*exp(x)/6 - 5*x*exp(x)/3 + 2*exp(x) - x - 2;

a(x) = -2 + 0*x;
b(x) = 1 + 0*x;
c(x) = x - x*exp(x);

x0 = 0;
xn = 2;

p1 = 0;
q1 = 1;
r1 = 0;

p2 = 0;
q2 = 1;
r2 = 4;

fprintf('\n\nUsing Forward-difference for 1st order and Central-difference for 2nd order\n')
N = [];
E = [];
for i = 1:6
	n = 5*2^(i-1);
	[X, Y] = forward(a, b, c, x0, xn, p1, q1, r1, p2, q2, r2, n);
	actual_Y = double(y(X));
	e = max(abs(Y - actual_Y'));
	N = [N, n];
	E = [E, e];
end

O = [log2(E(1:end-1)./E(2:end)), 0];
fprintf('\nN\tError\t\tOrder')

for i = 1:length(N)-1
	fprintf('\n%d\t%e\t%f', N(i), E(i), O(i))
end

triang_x = [N(trai), 2*N(trai)];
triang_y = [E(end-trai)/10, 2*E(end-trai)/10];
figure; loglog(N, E, 'b', triang_x([1,1,2,1]), triang_y([1,2,1,1]), 'k');
title('Using Forward-difference for 1st order and Central-difference for 2nd order'); xlabel('log(n)'); ylabel('log(error(n))');
saveas(gcf, sprintf(image_file, image_num)); image_num = image_num + 1;

figure; plot(X, Y, 'b', X, actual_Y, 'r');
title('Using Forward difference'); xlabel('x'); ylabel('y');
legend('y = numerically approximated funtion', 'y = original function');
saveas(gcf, sprintf(image_file, image_num)); image_num = image_num + 1;

fprintf('\n\nUsing Backward-difference for 1st order and Central-difference for 2nd order\n')
N = [];
E = [];
for i = 1:6
	n = 5*2^(i-1);
	[X, Y] = backward(a, b, c, x0, xn, p1, q1, r1, p2, q2, r2, n);
	actual_Y = double(y(X));
	e = max(abs(Y - actual_Y'));
	N = [N, n];
	E = [E, e];
end

O = [log2(E(1:end-1)./E(2:end)), 0];
fprintf('\nN\tError\t\tOrder')

for i = 1:length(N)-1
	fprintf('\n%d\t%e\t%f', N(i), E(i), O(i))
end

triang_x = [N(trai), 2*N(trai)];
triang_y = [E(end-trai)/10, 2*E(end-trai)/10];
figure; loglog(N, E, 'b', triang_x([1,1,2,1]), triang_y([1,2,1,1]), 'k');
title('Using Backward-difference for 1st order and Central-difference for 2nd order'); xlabel('log(n)'); ylabel('log(error(n))');
saveas(gcf, sprintf(image_file, image_num)); image_num = image_num + 1;

figure; plot(X, Y, 'b', X, actual_Y, 'r');
title('Using Backward difference'); xlabel('x'); ylabel('y');
legend('y = numerically approximated funtion', 'y = original function');
saveas(gcf, sprintf(image_file, image_num)); image_num = image_num + 1;

fprintf('\n\nUsing Central-difference for 1st order and Central-difference for 2nd order\n')
N = [];
E = [];
for i = 1:6
	n = 5*2^(i-1);
	[X, Y] = central(a, b, c, x0, xn, p1, q1, r1, p2, q2, r2, n);
	actual_Y = double(y(X));
	e = max(abs(Y - actual_Y'));
	N = [N, n];
	E = [E, e];
end

O = [log2(E(1:end-1)./E(2:end)), 0];
fprintf('\nN\tError\t\tOrder')

for i = 1:length(N)-1
	fprintf('\n%d\t%e\t%f', N(i), E(i), O(i))
end

triang_x = [N(trai), 2*N(trai)];
triang_y = [E(end-trai)/10, 2^2*E(end-trai)/10];
figure; loglog(N, E, 'b', triang_x([1,1,2,1]), triang_y([1,2,1,1]), 'k');
title('Using Central-difference for 1st order and Central-difference for 2nd order'); xlabel('log(n)'); ylabel('log(error(n))');
saveas(gcf, sprintf(image_file, image_num)); image_num = image_num + 1;

figure; plot(X, Y, 'b', X, actual_Y, 'r');
title('Using Central difference'); xlabel('x'); ylabel('y');
legend('y = numerically approximated funtion', 'y = original function');
saveas(gcf, sprintf(image_file, image_num)); image_num = image_num + 1;