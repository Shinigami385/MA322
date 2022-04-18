format long;
cd ..; fixed_point = @fixedPoint; cd q06;

x = 1.5;
epsilon = 1e-4;
max_iter = 1000;

[fixed status] = fixed_point(@g, x, epsilon, max_iter);