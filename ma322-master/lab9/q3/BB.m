close all; clear; cd ..; addpath(pwd); cd q3;
image_file = 'B_%d.jpg';
image_num = 1;
trai = 2;
tol = 1e-3;
m_iter = 1000;

syms x y;

% a*Uxx + b*Uxy + c*Uyy + d*Ux + e*Uy + f*U = g
a(x, y) = sym(1);
b(x, y) = sym(0);
c(x, y) = sym(1);
d(x, y) = sym(0);
e(x, y) = sym(0);
f(x, y) = sym(0);
g(x, y) = sym(0);

% End points
x0 = 0;
xn = 1;
y0 = 0;
yn = 1;

% Boundary Conditions
px0 = 0;
qx0 = 1;
rx0(y) = y/(1 + y^2);

pxn = 0;
qxn = 1;
rxn(y) = y/(4 + y^2);

py0 = 0;
qy0 = 1;
ry0(x) = sym(0);

pyn = 0;
qyn = 1;
ryn(x) = 1/(1 + (1 + x)^2);

% Solution
u(x, y) = y/((1 + x)^2 + y^2);

N = [];
E = [];
for i = 1:3
	n = 3*2^(i-1);
	tic
	[W, X, Y] = jacobi(a, b, c, d, e, f, g, x0, xn, y0, yn, px0, qx0, rx0, pxn, qxn, rxn, py0, qy0, ry0, pyn, qyn, ryn, n, tol, m_iter);
	U = double(u(X, Y));
	Err = abs(U - W);
	N = [N, n];
	E = [E, max(max(Err))];
	toc
	% U, W, Err
end

X = X(:, 1);
Y = Y(1, :);
O = [log2(E(1:end-1)./E(2:end)), 0];
fprintf('\nN\tError\t\tOrder')

for i = 1:length(N)-1
	fprintf('\n%d\t%e\t%f', N(i), E(i), O(i))
end

triang_x = [N(trai), 2*N(trai)];
triang_y = [E(end-trai)/10, 2^2*E(end-trai)/10];
figure; loglog(N, E, 'b', triang_x([1,1,2,1]), triang_y([1,2,1,1]), 'k');
title('Error convergence loglog plot'); xlabel('log(n)'); ylabel('log(error(n))');
saveas(gcf, sprintf(image_file, image_num)); image_num = image_num + 1;

figure;
surf(X, Y, U);% hold on; surf(X, Y, U); colormap('default');
title('Surface plot of original function'); xlabel('x'); ylabel('y'); zlabel('u(x, y)')
legend('z = original function');
saveas(gcf, sprintf(image_file, image_num)); image_num = image_num + 1;

figure;
surf(X, Y, W);
title('Surface plot of numerically approximated function'); xlabel('x'); ylabel('y'); zlabel('u(x, y)')
legend('z = numerically approximated funtion');
saveas(gcf, sprintf(image_file, image_num)); image_num = image_num + 1;

figure;
contour(X, Y, U);% hold on; surf(X, Y, U); colormap('default');
title('Contour plot of original function'); xlabel('x'); ylabel('y'); zlabel('u(x, y)')
legend('z = original function');
saveas(gcf, sprintf(image_file, image_num)); image_num = image_num + 1;

figure;
contour(X, Y, W);
title('Contour plot of numerically approximated function'); xlabel('x'); ylabel('y'); zlabel('u(x, y)')
legend('z = numerically approximated funtion');
saveas(gcf, sprintf(image_file, image_num)); image_num = image_num + 1;

figure;
surf(X, Y, Err);
title('Surface plot of absolute error'); xlabel('x'); ylabel('y'); zlabel('Error')
legend('z = Error');
saveas(gcf, sprintf(image_file, image_num)); image_num = image_num + 1;