cd ..; lip = @lagrangeInterpolatingPolynomial; cd q5;

x = [-1, -0.5, 0, 0.5];
y = [0.86199480, 0.95802009, 1.0986123, 1.2943767];

value = 0.25;
lagrange_value = lip(x, y, value)
% err = max(abs(lagrange_value - exact_value))
% [lagrange_value, exact_value, abs(newtonForwardDifference_value - exact_value)]
% plot(value, lagrange_value, col='r', value, exact_value, col='b');