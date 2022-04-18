clear all;
clc;

explict(0.1,0.0025);
cranknic(0.1,0.01);
function [E,F] = explict(h,k)
x = 0:h:0.5;
t = 0:k:1;
Z = zeros(size(x,2),size(t,2));
F = Z;
r = k/(h*h);
i = 2;
while i<=size(t,2)
j = 1;
while j<=size(x,2)
if j==1
Z(j,i) = 2*r*Z(2,i-1) + (1-2*r)*Z(1,i-1);
elseif j==size(x,2)
Z(j,i) = 2*h*r + 2*r*Z(size(x,2)-1,i-1) + (1-2*r)*Z(size(x,2),i-1);
else
Z(j,i) = r*Z(j+1,i-1) + (1-2*r)*Z(j,i-1) + r*Z(j-1,i-1);
end
j = j + 1;
end
i = i + 1;
end
i = 1;
while i<=size(t,2)
j = 1;
while j<=size(x,2)
F(j,i) = exactsol(x(j),t(i));
j = j + 1;
end
i = i + 1;
end
E = Z;
A = [1,2,3,4,5,6];
B = [5,21,201,401];
fprintf("\nExplict Method - \n")
fprintf("T X Explict Method Analytic Solution Error\n");
fprintf("-------------------------------------------------------------------------------------------\n");
for i = A
for j = B
fprintf("%.8f %.8f %d %d %d\n",t(j),x(i),E(i,j),F(i,j),abs(E(i,j)-F(i,j)));
end
end
end
function [C,F] = cranknic(h,k)
x = 0:h:0.5;
t = 0:k:1;
Z = zeros(size(x,2),size(t,2));
F = Z;
r = k/(h*h);
i = 2;
while i<=size(t,2)
A = zeros(size(x,2),size(x,2));
j = 1;
while j<=size(x,2)
if j==1
A(j,j) = 2+2*r;
A(j,j+1) = -2*r;
elseif j==size(x,2)
A(j,j-1) = -2*r;
A(j,j) = 2 + 2*r;
else
A(j,j-1) = -r;
A(j,j) = 2 + 2*r;
A(j,j+1) = -r;
end
j = j + 1;
end
b = zeros(size(x,2),1);
j = 1;
while j<= size(x,2)
if j==1
b(j,1) = (2-2*r)*Z(j,i-1) + 2*r*Z(j+1,i-1);
elseif j==size(x,2)
b(j,1) = 4*h*r + 2*r*Z(j-1,i-1) + (2 - 2*r)*Z(j,i-1);
else
b(j,1) = r*Z(j-1,i-1) + (2-2*r)*Z(j,i-1) + r*Z(j+1,i-1);
end
j = j + 1;
end
z = linsolve(A,b);
j = 1;
while j <=size(x,2)
Z(j,i) = z(j);
j = j + 1;
end
i = i + 1;
end
i= 1;
while i<=size(t,2)
j = 1;
while j<=size(x,2)
F(j,i) = exactsol(x(j),t(i));
j = j + 1;
end
i = i + 1;
end
C = Z;
A = [1,2,3,4,5,6];
B = [1,6,51,101];
fprintf("\nCranck-Nicolson - \n");
fprintf("\nT X Explict Method Analytic Solution Error\n");
fprintf("---------------------------------------------------------------------------------------------\n");
for i = A
for j = B
fprintf("%.8f %.8f %d %d %d\n",t(j),x(i),C(i,j),F(i,j),abs(C(i,j)-F(i,j)))
end
end
end
function e = exactsol(x,t)
e = 2*t + (12*x^2 - 1)/12;
u = 0;
i = 1;
while i<=1000
u = u + ((-1)^i)*(exp(-4*pi*pi*i*i*t)*cos(2*i*pi*x))/(i^2);
i = i + 1;
end
e = e - u/(pi^2);
end