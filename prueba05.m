% prueba05.m
% Criterio de Convergencia del metodo
% Aproximaciones Sucesivas o Punto Fijo
% Sin necesidad hacer iteracion
% Hay convergencia si y solo si |G'(x0)|<1
% x0 es un valor cercano a la raiz
clc
clear all
syms x  % define x como variable
g=(x+10)^(1/3)
dg=diff(g,x)
x0=2.5
m=abs(double(subs(dg,x,x0)))
if m<1
    disp('Punto Fijo Convergente!!!')
else    
    disp('Punto Fijo Divergente!!!')
end
% m cerca [0,1/3], convergencia rapida
% m cerca <1/3,2/3], convergencia mediana
% m cerca <2/3,1>, convergencia lenta
% Analisis de casos
% Gi(x)          Converge?   |g'(x0)|   Velocidad
% (x+10)^(1/3)      si        0.062        Rapida     
%                   no                     ------
%
%

