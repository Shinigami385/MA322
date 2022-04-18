clear all;
format long;
fprintf('\n Question 2 \n');
a=0;
b=1;
n=100;
ans= 0.0808308960; 
fprintf('simple trapezoidal rule: value= %.18f, error = %.18f \n',trap(100),trap(100)-ans)
fprintf('simple trapezoidal rule: value= %.18f, error = %.18f ',corr_trap(100),corr_trap(100)-ans)



function fv=f(x)
fv= x*x*exp(-2*x);
end
function gv=g(x)
gv= 2*x*(exp(-2*x))-2*x*x*exp(-2*x);
end

function tv=trap(n)
b=1;a=0;
    h=(b-a)/n;
s=0.5*(f(b)+f(a));
for i=1:n-1
    s=s+f(a+i*(h));
end
tv=s*h;
end

function tv=corr_trap(n)
b=1;a=0;
    h=(b-a)/n;
s=0.5*(f(b)+f(a));

derfa= g(0);
derfb= g(1);
for i=1:n-1
    s=s+f(a+i*(h));
end
s=s+(h/12)*(derfa-derfb);
tv=s*h;
end