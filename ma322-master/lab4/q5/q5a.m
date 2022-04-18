cd ..; lip = @lagrangeInterpolatingPolynomial; cd q5;

x = [0.1, 0.2, 0.3, 0.4];
y = [-0.29004986, -0.56079734, -0.81401972, -1.0526302];

value = 0.18;
lagrange_value = lip(x, y, value)
% err = max(abs(lagrange_value - exact_value))
% [lagrange_value, exact_value, abs(newtonForwardDifference_value - exact_value)]
% plot(value, lagrange_value, col='r', value, exact_value, col='b');