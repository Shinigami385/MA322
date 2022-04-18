clear all;
bisection = @biSection;
newtonmethod = @newtonMethod;
a = 2;
b = 2.1;
x = 1;
epsilon = 1e-6;
max_iter = 1000;

bisection(@f, a, b, epsilon, max_iter)
% newtonmethod(@f,@df,x,epsilon,max_iter)