fprintf('for m=1: P= %.10f\n',simpson(100,1))
fprintf('for m=2: P= %.10f',simpson(100,2))


function fv=f(z)
fv= exp(-z*z/2);
end


function sv=simpson(n,m)
b=m;a=-m;
    h=(b-a)/n;
s=(f(b)+f(a));
for i=1:n-1
    if rem(i,2)==0
        s=s+2*(f(a+i*h));
    else
        s=s+4*(f(a+i*h));
    end
    %s=s+f(a+i*(h));
end
sv=(1/sqrt(2*pi))*(s*h/3);
end