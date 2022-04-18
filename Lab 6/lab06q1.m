clc;
clear all;

f = @(x) (sin(2*x+2)/(x+1));
gqr = @() 5/9*f(sqrt(3/5)) + 8/9*f(0) + 5/9*f(-sqrt(3/5));
y = gqr();
fprintf('The value of integral is %f\n',y);