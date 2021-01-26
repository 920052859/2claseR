% Sucesivas o Punto Fijo
clc
clear all
g=inline('(x+10)^(1/3)')
% f=inline('x^3-x-10')   x=g(x)
% x=(x+10)^(1/3)
% x=x^3-10
% x=10/(x^2-1)
% x=(x+10)/x^3
% x=((x+10)/x)^0.5
% Intervalos que contienen raices...
%     2     3
x0=2.5; acum=[x0 NaN]; TOL=1e-15;
for i=1:1000
    xn=g(x0);
    res=abs(xn-x0);  % Error de Sucesion
    acum=[acum; xn res];
    x0=xn;
    if res<TOL % cond_parada
        break
    end    
end  
disp('xn           res')
disp(acum)
Raiz=xn
NumIte=i
% Analisis de casos