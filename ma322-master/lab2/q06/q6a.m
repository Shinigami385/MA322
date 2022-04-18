format short;
cd ..; fixed_point = @fixedPoint; cd q06;

epsilon = 1e-5;
max_iter = 1000;

x = -0.5;
[fixed, status, iterations, data] = fixed_point(@g11, x, epsilon, max_iter)

x = 0.5;
[fixed, status, iterations, data] = fixed_point(@g12, x, epsilon, max_iter)

x = 3.5;
[fixed, status, iterations, data] = fixed_point(@g13, x, epsilon, max_iter)