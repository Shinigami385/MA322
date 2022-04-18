cd ..; nfd = @newtonForwardDifference; nbd = @newtonBackwardDifference; cd q1;

x = [1, 1.5, 2, 2.5];
y = [2.7183, 4.4817, 7.3819, 12.1825];

value = 2.25;
newtonForwardDifference_value = nfd(x, y, value)
newtonBackwardDifference_value = nbd(x, y, value)
exace_value = exp(value)