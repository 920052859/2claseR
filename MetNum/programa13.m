% programa12.m
% trazado de curvas mediante spline cubico
clc
clear all
y=[0  0    0   0    0  0.25 0.5  0.75  1  1    1    1    1    1 0.25 0.5 0.75 0]
x=[0 0.25 0.5 0.75  1   1    1     1   1 0.25 0.5  0.75 0.85  0   0   0   0  0]
p=1:length(x);   % Vector auxiliar ordenado crecientemente
pp=1:0.8:length(x);
xx=spline(p,x,pp);
yy=spline(p,y,pp);
plot(x,y,'o',xx,yy)
grid
% Agregar mas puntos para tenga forma cuadrado