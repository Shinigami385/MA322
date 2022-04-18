clear;
clc;
f = @(x, y) x.^-2 .* (x .* y - y.^2);
sol = @(x)  (0.5 + log(x)).^-1 * x;

for h = [0.1 0.01]
    fprintf("h = %.2f \n", h);
    pts = [1.2 1.4 1.6 1.8 2];
    inds = (pts - 1) / h + 1;
    n = 1/h + 1;
    x = zeros(1, n);
    y = zeros(1, n);
    yrk2 = zeros(1, n);
    yrk4 = zeros(1, n);
    s = zeros(1, n);
    
    x(1) = 1;
    y(1) = 2;
    yrk2(1) = 2;
    yrk4(1) = 2;
    
    for i = 2:n
        % EM
        y(i) = y(i-1) + h * f(x(i-1), y(i-1));
        x(i) = x(i-1) + h;

        %RK2
        k1 = h * f(x(i-1), yrk2(i-1));
        k2 = h * f(x(i-1) + h, yrk2(i-1) + k1);
        yrk2(i) = yrk2(i-1) + 0.5 * (k1 + k2);

        %RK4
        k1 = h * f(x(i-1), yrk4(i-1));
        k2 = h * f(x(i-1) + h/2, yrk4(i-1) + 0.5 * k1);
        k3 = h * f(x(i-1) + h/2, yrk4(i-1) + 0.5 * k2);
        k4 = h * f(x(i-1) + h, yrk4(i-1) + k3);
        yrk4(i) = yrk4(i-1) + (k1 + 2*k2 + 2*k3 + k4) / 6;
        s(i) = sol(x(i));
    end
    fprintf("x\t\t\tEM\t\tError(EM)\t\tRK2\t\tError(RK2)\t\tRK4\t\tError(RK4)\n");
    for i = inds
        ii = round(i);
        fprintf("%.2f \t %.7f %.7f \t  %.7f %.7f \t %.7f %.7f \n", x(ii), y(ii), s(ii) - y(ii), ...
            yrk2(ii), s(ii) - yrk2(ii), yrk4(ii), s(ii) - yrk4(ii));
    end
    fprintf('\n');
end

