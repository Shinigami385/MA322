clear all;

%Using Composite Midpoint rule

%Part a

f = @(x) (x.^2).*exp(-(x.*x));
n = 8;
a=0;
b=2;
h = (b-a)/n;
x = [a:h:b];

val = 0;
for i=1:n
 val = val + f((x(i) + x(i+1))/2);  
end
val  = val*h;
fprintf('Estimate by the composite midpoint rule is: %.5f.\n', val);

%Part b

f = @(x) (1./(x.*log(x)));
n = 8;
a = exp(1);
b = exp(1) + 2;
h = (b-a)/n;
x = [a:h:b];

val =0;
for i=1:n
 val = val + f((x(i) + x(i+1))/2);  
end
val  = val*h;
fprintf('Estimate by the composite midpoint rule is: %.5f.\n', val);

%Part c

f = @(x) (x.*x).*(log(x.*x + 1));
n = 8;
a = 0;
b = 2;
h = (b-a)/n;
x = [a:h:b];

val =0;
for i=1:n
 val = val + f((x(i) + x(i+1))/2);  
end
val  = val*h;
fprintf('Estimate by the composite midpoint rule is: %.5f.\n', val);

%Part d

f = @(x) (sin(x)).^2 -(2.*x.*sin(x)) + 1;
n = 8;
a = 0.75;
b = 1.75;
h = (b-a)/n;
x = [a:h:b];

val =0;
for i=1:n
 val = val + f((x(i) + x(i+1))/2);  
end
val  = val*h;
fprintf('Estimate by the composite midpoint rule is: %.5f.\n', val);


%Using Composite Simpson's rule

%Part a

f = @(x) (x.^2).*exp(-(x.*x));
n = 8;
a=0;
b=2;
h = (b-a)/n;
x = [a:h:b];
y = f(x);

val = y(1) + y(n+1);
for i=2:n
    val = val + 2*y(i);
end
for i=1:n
    val = val + 4*f((x(i) + x(i+1))/2);
end

val  = val*(h/6);
fprintf('Estimate by the composite Simpson rule is: %.5f.\n', val);

%Part b

f = @(x) (1./(x.*log(x)));
n = 8;
a = exp(1);
b = exp(1) + 2;
h = (b-a)/n;
x = [a:h:b];
y = f(x);

val = y(1) + y(n+1);
for i=2:n
    val = val + 2*y(i);
end
for i=1:n
    val = val + 4*f((x(i) + x(i+1))/2);
end

val  = val*(h/6);
fprintf('Estimate by the composite Simpson rule is: %.5f.\n', val);

%Part c

f = @(x) (x.*x).*(log(x.*x + 1));
n = 8;
a = 0;
b = 2;
h = (b-a)/n;
x = [a:h:b];
y = f(x);

val = y(1) + y(n+1);
for i=2:n
    val = val + 2*y(i);
end
for i=1:n
    val = val + 4*f((x(i) + x(i+1))/2);
end
val  = val*(h/6);
fprintf('Estimate by the composite Simpson rule is: %.5f.\n', val);

%Part d

f = @(x) (sin(x)).^2 -(2.*x.*sin(x)) + 1;
n = 8;
a = 0.75;
b = 1.75;
h = (b-a)/n;
x = [a:h:b];
y = f(x);

val = y(1) + y(n+1);
for i=2:n
    val = val + 2*y(i);
end
for i=1:n
    val = val + 4*f((x(i) + x(i+1))/2);
end

val  = val*(h/6);
fprintf('Estimate by the composite Simpson rule is: %.5f.\n', val);