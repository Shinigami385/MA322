clc;
clear;
n_given = [2,4,8,16,32];
E = [0,0,0,0,0];
temp = 1;
for n=[2,4,8,16,32]
    f = @(x) exp(x);
    x = linspace(-1,1,n+1);
    y = f(x);
    xp = linspace(-1,1,501);
    diff = zeros(n+1,n+1);
    diff(:,1)=y;
    
    for j=2:n+1
        for i=1:1:n-j+2
        diff(i,j)=diff(i+1,j-1)-diff(i,j-1);
        end
    end
    answer = y(1);
    h=x(2) - x(1);
    p=(xp-x(1))/h;
    for i=1:n
        term=1;
        for j=1:i
            term=term.*(p-j+1)/j;
        end
        answer = answer+term.*diff(1,i+1);
    end
    fp = answer;
    En = max(f(xp)-fp);
    fprintf('En = %u for n = %u\n',En,n);
    E(temp)=En;
    temp = temp+1;
end
E
plot(n_given, E)