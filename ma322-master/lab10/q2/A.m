close all; clear; cd ..; addpath(pwd); cd q2;
image_file = 'A_%d.jpg';
image_num = 1;
trai = 2;

syms x t;

% Ut = c*Uxx
c = 4/pi^2;

% End points
x0 = 0;
xn = 4;
t0 = 0;
tn = 1;

% Boundary Conditions
ut0(x) = sin(x*pi/4)*(1 + 2*cos(x*pi/4));
ux0(t) = sym(0);
uxn(t) = sym(0);

% Solution
u(t, x) = exp(-t)*sin(x*pi/2) + exp(-t/4)*sin(x*pi/4);

N = [];
E = [];
for i = 3:5
	n = 2^i;
	tic
	[W, X, T] = btcs(c, t0, tn, x0, xn, ut0, ux0, uxn, n);
	U = zeros(length(T), length(X));
	for i = 1:length(T)
		for j = 1:length(X)
			U(i, j) = u(T(i), X(j));
		end
	end
	Err = abs(U - W);
	N = [N, n];
	E = [E, max(max(Err))];
	toc
end

O = [log2(E(1:end-1)./E(2:end)), 1];
fprintf('\nN\tError\t\tOrder')

for i = 1:length(N)
	fprintf('\n%d\t%e\t%f', N(i), E(i), O(i))
end

triang_x = [N(trai), 2*N(trai)];
triang_y = [E(end-trai)/10, 2*E(end-trai)/10];
figure; loglog(N, E, 'b', triang_x([1,1,2,1]), triang_y([1,2,1,1]), 'k');
title('Error convergence loglog plot'); xlabel('log(n)'); ylabel('log(error(n))');
saveas(gcf, sprintf(image_file, image_num)); image_num = image_num + 1;

figure;
surf(X, T, U);% hold on; surf(X, T, U); colormap('default');
title('Surface plot of original function'); xlabel('x'); ylabel('t'); zlabel('u(x, t)')
legend('z = original function');
saveas(gcf, sprintf(image_file, image_num)); image_num = image_num + 1;

figure;
surf(X, T, W);
title('Surface plot of numerically approximated function'); xlabel('x'); ylabel('t'); zlabel('u(x, t)')
legend('z = numerically approximated funtion');
saveas(gcf, sprintf(image_file, image_num)); image_num = image_num + 1;

figure;
contour(X, T, U);% hold on; surf(X, T, U); colormap('default');
title('Contour plot of original function'); xlabel('x'); ylabel('t'); zlabel('u(x, t)')
legend('z = original function');
saveas(gcf, sprintf(image_file, image_num)); image_num = image_num + 1;

figure;
contour(X, T, W);
title('Contour plot of numerically approximated function'); xlabel('x'); ylabel('t'); zlabel('u(x, t)')
legend('z = numerically approximated funtion');
saveas(gcf, sprintf(image_file, image_num)); image_num = image_num + 1;

figure;
plot(X, U(end, :), 'b', X, W(end, :), 'r');
title('Exact and numerical Solution at final time level'); xlabel('x'); ylabel('Solution');
legend('Exact', 'Numerical');
saveas(gcf, sprintf(image_file, image_num)); image_num = image_num + 1;