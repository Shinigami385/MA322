clear all;
f1 = @(x1,x2) sin(x1*x2) + x1 - x2;
f2 = @(x1,x2) x2*cos(x1*x2) + 1;
a = [1;2];

Newton(a,f1,f2);
function Newton(a,f1,f2)
    syms x y;
    F = jacobian([f1(x,y),f2(x,y)],[x y]);
    fprintf('%2s %15s %15s %15s %15s \n', 'n', 'x1', 'x2', 'f1(x1,x2)', 'f2(x1,x2)');   
    i = 1;
    a_old = [0;0];
    f = zeros(2,1);
    while(norm(a-a_old,Inf)>10^(-3))
        a_old=a;
        f(1) = f1(a(1),a(2));
        f(2) = f2(a(1),a(2));
        fprintf('%2d %15f %15f %15f %15f \n', i, a(1), a(2), f(1), f(2));
        A = subs(inv(F),{x,y},{a(1),a(2)});
        a = a - A*f;
        i=i+1;
    end
    fprintf('%2d %15f %15f %15f %15f \n', i, a(1), a(2), f(1), f(2));
end