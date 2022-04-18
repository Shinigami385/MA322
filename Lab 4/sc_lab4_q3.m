clear
clc

x = [0.398, 0.399, 0.400, 0.401, 0.402];
y = [0.408591, 0.409671, 0.410752, 0.411834, 0.412915];

fprintf("\n\nAt x=1, with h=0.001 \n");
fprintf("central difference is: %.9f , error is %.9f\n", centraldiff(0.400, 0.001), abs(1.081072 - centraldiff(0.400, 0.001)));
fprintf("taylor difference is: %.9f, error is %.9f \n", fprime(0.400, 0.001), abs(1.081072 - fprime(0.400, 0.001)));
fprintf("F' is: 1.081072. \n");


function [value] = f(x)
if x==0.398
    value = 0.408591;
elseif x==0.399
        value = 0.409671;
elseif x==0.400
        value = 0.410752;
elseif x==0.401
        value = 0.411834;
elseif x==0.402
        value = 0.412915;
end
end

function [value] = centraldiff(x, h)
value = (f(x+h) - f(x-h))/(2*h);
end

function [value] = fprime(x, h)
value = (-f(x+2*h) + 8*f(x+h) - 8*f(x-h) + f(x-2*h))/(12*h);
end