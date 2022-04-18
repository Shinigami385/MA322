cd ..; ndd = @newtonDividedDifference; cd q6;

x = [1950, 1960, 1970, 1980, 1990, 2000];
y = [151326, 179323, 203302, 226542, 249633, 281422];

value = [1940; 1975; 2020];
function_value = ndd(x, y, value)
% err = max(abs(lagrange_value - exact_value))
% [lagrange_value, exact_value, abs(newtonForwardDifference_value - exact_value)]
% plot(value, lagrange_value, col='r', value, exact_value, col='b');