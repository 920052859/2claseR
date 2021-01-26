% programaa03.m
% Calcular raices de una ecuacion no lineal
% de una variable usando Newton-Raphson
clc
clear all
f=inline('x^3-x-10')
df=inline('3*x^2-1')
% Intervalos que contienen raices...
%     2     3
x0=2.5; acum=[x0 NaN]; TOL=1e-10;
for i=1:10
    xn=x0-f(x0)/df(x0);
    res=abs(xn-x0);  % Error de Sucesion
    acum=[acum; xn res];
    x0=xn;
    if res<TOL
        break
    end    
end  
disp('xn           res')
disp(acum)