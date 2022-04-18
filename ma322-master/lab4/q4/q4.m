cd ..; lip = @lagrangeInterpolatingPolynomial; nfd = @newtonForwardDifference;  cd q4;

x = [1, 1.1, 1.3, 1.4];
y = log(x);

value = 1:0.1:1.4;
value = value';
lagrange_value = lip(x, y, value);
exact_value = log(value);
err = max(abs(lagrange_value - exact_value))

%[lagrange_value, exact_value, abs(newtonForwardDifference_value - exact_value)]