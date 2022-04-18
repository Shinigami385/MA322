clear all;
clc;
clf;

f = @(t,y) (-50*y + 51*cos(t) + 49*sin(t));
sol = @(t) (sin(t) + cos(t));

%Using Adams Bashforth h = 0.01
h = 0.01;
a = 0;
b = 10;
for i=1:4
    initial(i)= sol(a + (i-1)*h);
end
% Adams_Bashforth(h, f, sol, a, b, initial, 7);
Adams_Moulton(h, f, sol, a, b, initial, 1);

%Using Adams Bashforth h = 0.001
h = 0.001;
a = 0;
b = 10;
for i=1:4
    initial(i)= sol(a + (i-1)*h);
end
Adams_Bashforth(h, f, sol, a, b, initial, 3);
Adams_Moulton(h, f, sol, a, b, initial, 5);

function Adams_Bashforth(h, f, sol, a, b, initial, fig)
    prev3 = initial(1);
    prev2 = initial(2);
    prev1 = initial(3);
    prev = initial(4);
    n = (b-(a+3*h))/h;
    fprintf('t \t\t Approx \t Exact \t\t Error\n');
    t = a + 3*h;
    for i = 1:n
        y(i) = prev + (h/24)*(55*f(t, prev) - 59*f(t-h, prev1) + 37*f(t-2*h, prev2) -9*f(t-3*h, prev3));
        prev3 = prev2;
        prev2 = prev1;
        prev1 = prev;
        prev = y(i);
        t = t + h;
        err(i) = abs(sol(t) - y(i));
        fprintf('%f \t %f \t %f \t %f\n', t,y(i),sol(t),err(i));  
    end    
    y = [initial(4) y];
    err = [abs(sol(a+3*h) - initial(4)) err];
    figure(fig);
    plot(a+3*h:h:b, y);
    hold on;
    xx = a+3*h:h:b;
    plot(xx,sol(xx),'--', 'linewidth', 2);
    legend('Approximation', 'Exact Solution');
    xlabel('t(i)');
    ylabel('y(t(i))');
    figure(fig+1);
    plot(a+3*h:h:b,err);
    xlabel('t(i)');
    ylabel('Error');
end

function Adams_Moulton(h, f, sol, a, b, initial, fig)
    prev3 = initial(1);
    prev2 = initial(2);
    prev1 = initial(3);
    prev = initial(4);
    n = (b-(a+3*h))/h;
    fprintf('t \t\t Approx \t Exact \t\t Error\n');
    t = a + 3*h;
    tol =  1e-8;
    for i = 1:n
        y_old = prev + (h/24)*(55*f(t, prev) - 59*f(t-h, prev1) + 37*f(t-2*h, prev2) -9*f(t-3*h, prev3));
        y_new = prev + (h/24)*(9*f(t+h,y_old) + 19*f(t,prev) -5*f(t-h,prev1) + f(t-2*h, prev2));
        while abs(y_new - y_old) > tol
            save = y_new;
            y_new = prev + (h/24)*(9*f(t+h,y_old) + 19*f(t,prev) -5*f(t-h,prev1) + f(t-2*h, prev2));
            y_old = save;
        end
        y(i) = y_new;
        prev3 = prev2;
        prev2 = prev1;
        prev1 = prev;
        prev = y(i);
        t = t + h;
        err(i) = abs(sol(t) - y(i));
        fprintf('%f \t %f \t %f \t %f\n', t,y(i),sol(t),err(i));  
    end    
    y = [initial(4) y];
    err = [abs(sol(a+3*h) - initial(4)) err];
    figure(fig);
    plot(a+3*h:h:b, y);
    hold on;
    xx = a+3*h:h:b;
    plot(xx,sol(xx),'--', 'linewidth', 2);
    legend('Approximation', 'Exact Solution');
    xlabel('t(i)');
    ylabel('y(t(i))');
    figure(fig+1);
    plot(a+3*h:h:b,err);
    xlabel('t(i)');
    ylabel('Error');
end