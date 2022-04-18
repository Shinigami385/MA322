cd ..; nfd = @newtonForwardDifference; cd q3;

x = 1:0.5:6;
y = atan(x);

value = 0:0.25:8;
value = value';
[newtonForwardDifference_value, coefficients] = nfd(x, y, value);
exact_value = atan(value);
coefficients
[value, newtonForwardDifference_value, exact_value, abs(newtonForwardDifference_value - exact_value)]

plot(value, newtonForwardDifference_value, 'r', value, atan(value), 'b');