clear all;
format long;
fixed_point = @fixedPoint;

x = 0;
epsilon = 1e-3;
max_iter = 1000;

fixed_point(@g, x, epsilon, max_iter)