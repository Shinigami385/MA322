clear all;
clc;
%-y'' + p(x)y' + q(x)y = r(x)

p = @(x) -x;
q = @(x) 2;
r = @(x) -2 -(2+x.^2)*exp(x);
a = -1;
b = 0;
alpha = -2;
beta = 1;
h = 1/400;
exact_sol = @(x) x.^2 + x.*exp(x);
fprintf('Q2(a)\n');
y = second_orderQ2(a,b,h,alpha,beta,p,q,r);
plot_error([a:h:b],y,exact_sol);

%Q2(b)
p = @(x) 0;
q = @(x) -x;
r = @(x) (-3+x+x.^2 - x.^3).*sin(x) - 4*x.*cos(x);
h = 1/400;
a = 0;
b = 1;
alpha = -1;
beta = 2*sin(1);
exact_sol = @(x) (x.^2 + x.*exp(x));
fprintf('\n\nQ2(b)\n');
y = second_orderQ2(a,b,h,alpha,beta,p,q,r);

%Functions
function y = second_orderQ2(a,b,h,alpha,beta,p,q,r)
t = [a:h:b];
n = length(t);

%Hard coded boundary condition for Q1
A(1,1) = -1/h;
A(1,2) = 1/h;
b(1) = alpha;
A(n,n) = 1/h;
A(n,n-1) = -1/h;
b(n,1) = beta;

for i=2:n-1
    A(i,i-1) =  -1/h^2 - p(t(i))/(2*h);
    A(i,i) = (2/h^2 + q(t(i)));
    A(i,i+1) = (-1/h + p(t(i))/2)/h;
    b(i) = r(t(i));
end

y = A\b;
figure;
plot(t,y);
xlabel('x');
ylabel('y(x)');
title('Second Order Solution');

end

function plot_error(x,y,exact_sol)
error = abs(exact_sol(x) - y');
%plot
figure;
plot(x,error);
xlabel('x');
ylabel('Error(x)');
title('Error');

end