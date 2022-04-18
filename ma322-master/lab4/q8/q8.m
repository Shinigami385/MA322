cd ..; ndd = @newtonDividedDifference; lip = @lagrangeInterpolatingPolynomial; cd q8
format long;

x = [0.0, 0.1, 0.3, 0.6, 1.0];
y = [-6.00000, -5.89483, -5.65014, -5.17788, -4.28172];

value = 0.2;
newtonDividedDifference_function_value = ndd(x, y, value)
lagrangeInterpolatingPolynomial_value = lip(x, y, value)

x = [x, 1.1];
y = [y, -3.99583];

newtonDividedDifference_function_value = ndd(x, y, value)
lagrangeInterpolatingPolynomial_value = lip(x, y, value)

% err = max(abs(lagrange_value - exact_value))
% [lagrange_value, exact_value, abs(newtonForwardDifference_value - exact_value)]
% plot(value, lagrange_value, col='r', value, exact_value, col='b');