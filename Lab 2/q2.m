clear all;
clc;
clf;
close all;
f = @(x) (x-1.1)^2 * (x+1);

syms x
F = (x-1.1)^2 * (x+1);

X1 = Newton(f,F,2);
Y1 = modifNewton(f,F,2,2);
convert(X1);
convert(Y1); 


function convert(X)
    fprintf('%s %20s %20s %20s\n','n','x','f(x)','p');
    for i = 1:height(X)
        if i<= (height(X) -2)
            X(i,4) = log10(  ( abs(1.1 - X(i+2,2))/abs(1.1 - X(i+1,2)) )  ) / log10( abs(1.1 - X(i+1,2))/abs(1.1 - X(i,2)) )   ;
        else 
            X(i,4) = NaN;
        end

        fprintf('%2d %20f %20f %20f\n', X(i,1)+1, X(i,2), X(i,3), X(i,4));
    end
    fprintf('\n');

end    

function  X = Newton(f,F,x)
    F = diff(F);
    i = 0;
    df = matlabFunction(F);
    %fprintf('%s %20s %20s\n','n','x','f(x)');
    while(abs(f(x))>1e-8)
        X(i+1,1)=i;
        X(i+1,2)=x;
        X(i+1,3)=f(x);
        %fprintf('%2d %20f %20f\n',i,x,f(x));
        x = x-(f(x)/df(x));
        i = i+1;
    end
    X(i+1,1)=i;
    X(i+1,2)=x;
    X(i+1,3)=f(x);
    %fprintf('%2d %20f %20f\n',i,x,f(x));
end

function X = modifNewton(f,F,x,p)
    F = diff(F);
    i = 0;
    df = matlabFunction(F);
    %fprintf('%s %20s %20s\n','n','x','f(x)');
    while(abs(f(x))>1e-6)
        X(i+1,1)=i;
        X(i+1,2)=x;
        X(i+1,3)=f(x);
        %fprintf('%2d %20f %20f\n',i,x,f(x));
        x = x-p*(f(x)/df(x));
        i = i+1;
    end
    X(i+1,1)=i;
    X(i+1,2)=x;
    X(i+1,3)=f(x);
    %fprintf('%2d %20f %20f\n',i,x,f(x));
end