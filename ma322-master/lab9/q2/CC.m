close all; clear; cd ..; addpath(pwd); cd q2;
image_file = 'C_%d.jpg';
image_num = 1;
trai = 1;
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
g(x, y) = pi^2*cos(pi*x);

% End points
x0 = 0;
xn = 1;
y0 = 0;
yn = 1;

% Boundary Conditions
px0 = 1;
qx0 = 0;
rx0(y) = sym(0);

pxn = 1;
qxn = 0;
rxn(y) = sym(0);

py0 = 1;
qy0 = 0;
ry0(x) = sym(0);

pyn = 1;
qyn = 0;
ryn(x) = sym(0);

N = [];
E = [];
for i = 1:2
	n = 3*2^(i-1);
	tic
	[W, X, Y] = gauss_seidel(a, b, c, d, e, f, g, x0, xn, y0, yn, px0, qx0, rx0, pxn, qxn, rxn, py0, qy0, ry0, pyn, qyn, ryn, n, tol, m_iter);
	toc

end

figure;
surf(X, Y, W);
title('Surface plot of numerically approximated function'); xlabel('x'); ylabel('y'); zlabel('u(x, y)')
legend('z = numerically approximated funtion');
saveas(gcf, sprintf(image_file, image_num)); image_num = image_num + 1;


figure;
contour(X, Y, W);
title('Contour plot of numerically approximated function'); xlabel('x'); ylabel('y'); zlabel('u(x, y)')
legend('z = numerically approximated funtion');
saveas(gcf, sprintf(image_file, image_num)); image_num = image_num + 1;
