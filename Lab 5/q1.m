clear;
clc;

% Question(1)
fprintf('\n Question 1 \n');
f=@(x) exp(-x.^2);
a=0; b=1;
N=[50,100,200];

fprintf("N        Rrule               Trule         Srule               Er                  Et                  Es\n");

for i=1:3
    Iab=integral(f,a,b);
    X=linspace(a,b,N(i));
    y=f(X);
    g1=0.74682413;
    
% (1) Rectangle Rule 
    
    Ir =0;
    h=(b-a)/N(i);
    for k=1:N(i)-1
        Ir =Ir+h*y(k);
    end
    Er=abs(g1-Ir);
    
%  (2) Trapezoidal rule

s= 0.5*(f(a)+f(b));
h=(b-a)/N(i);
for k=1:1:N(i)-1
    s=s+f(a+ k*h);
end
It=h*s;
Et=abs(It-g1);

%  (3) Simpson's rule
s1=f(a)+f(b);
for k=1:2:N(i)-1
    s1=s1+4*f(a+k*h);
end

for k=2:2:N(i)-2
    s1=s1+2*f(a+k*h);
end

Is=(h/3)*s1;
Es=abs(Is-g1);



    fprintf("%d    %.12f    %.12f    %.12f    %.12f    %.12f    %.12f    \n",N(i),Ir,h*s,(h/3)*s1,Er,Et,Es);

end