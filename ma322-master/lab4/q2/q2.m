cd ..; nfd = @newtonForwardDifference; nbd = @newtonBackwardDifference; cd q2;

x = [0.0, 0.2, 0.4, 0.6, 0.8];
y = [1.00000, 1.22140, 1.49182, 1.82212, 2.22554];

value = 0.05;
newtonForwardDifference_value = nfd(x, y, value)

value = 0.65;
newtonBackwardDifference_value = nbd(x, y, value)