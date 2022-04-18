%% Lagrangian interpolation
clear;clc;close all;

for i = 1:9
    X(i) = 5*(i-5)/4;
    Y(i) = 1/(1+(X(i)*X(i)));
end


xq=-5:0.1:5;
f = @(x) 1/(1+(x^2));
y = arrayfun(f,xq);
syms x
S=0;
for i=1:length(X)
    temp=X;
    A=temp(i);
    temp(i)=[];
    L=prod((x-temp)./(A-temp),'all');
    S=(L*Y(i))+S;
    L=[];
end

figure()
fplot(S,'black--',[min(X) max(X)]);
hold on
F=interp1(X,Y,xq);
%%plot(xq,F,"bo");
hold on
plot(xq,y,"r");
legend("Lagrangian","interp1","f(x)",'Location','north');
xlabel(" X axis ");
ylabel(" Y axis");
title("Lagrangian interpolation VS interp1-MatlabFunction")
