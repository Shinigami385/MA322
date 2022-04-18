clear
clc
H = [0.1, 0.01, 0.001];
Ef = [abs(fprime(1) - forwardder(1, 0.1)), abs(fprime(1) - forwardder(1, 0.01)), abs(fprime(1) - forwardder(1, 0.001))];
Eb = [abs(fprime(1) - backwardder(1, 0.1)), abs(fprime(1) - backwardder(1, 0.01)), abs(fprime(1) - backwardder(1, 0.001))];
Ec = [abs(fprime(1) - centraldiff(1, 0.1)), abs(fprime(1) - centraldiff(1, 0.01)), abs(fprime(1) - centraldiff(1, 0.001))];

fprintf("\n\nAt x=1, with h=0.1 \n");
fprintf("forward difference is: %.9f , error is %.9f\n", forwardder(1, 0.1), Ef(1));
fprintf("backward difference is: %.9f, error is %.9f \n", backwardder(1, 0.1), Eb(1));
fprintf("central difference is: %.9f , error is %.9f\n", centraldiff(1, 0.1), Ec(1));
fprintf("F' is: %.9f \n", fprime(1));

fprintf("\n\nAt x=1, with h=0.01 \n");
fprintf("forward difference is: %.9f , error is %.9f\n", forwardder(1, 0.01), Ef(2));
fprintf("backward difference is: %.9f, error is %.9f \n", backwardder(1, 0.01), Eb(2));
fprintf("central difference is: %.9f , error is %.9f\n", centraldiff(1, 0.01), Ec(2));
fprintf("F' is: %.9f \n", fprime(1));

fprintf("\n\nAt x=1, with h=0.001 \n");
fprintf("forward difference is: %.9f , error is %.9f\n", forwardder(1, 0.001), Ef(3));
fprintf("backward difference is: %.9f, error is %.9f \n", backwardder(1, 0.001), Eb(3));
fprintf("central difference is: %.9f , error is %.9f\n", centraldiff(1, 0.001), Ec(3));
fprintf("F' is: %.9f \n", fprime(1));

plot(H, Ef, 'm')
hold on
plot(H, Eb, 'b')
plot(H, Ec, 'g')
hold off

function [value] = forwardder(x, h)
value = (f(x+h) - f(x))/(h);
end

function [value] = backwardder(x, h)
value = (f(x) - f(x-h))/(h);
end

function [value] = centraldiff(x, h)
value = (f(x+h) - f(x-h))/(2*h);
end

function [value] = f(x)
value = x*log(1+(x*x));
end

function [value] = fprime(x)
value = log(1+(x*x)) + ((1/(1+x*x))*2*x*x);
end