clc;
clear all;

f = @(x) x^3;
w1 = 0.8535533903;
w2 = 0.1464466092;
x1 = 2-sqrt(2);
x2 = 2+sqrt(2);

y = w1*f(x1)+w2*f(x2);
fprintf('The value of integral is %f\n',y);