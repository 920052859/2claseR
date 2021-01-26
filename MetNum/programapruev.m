% programa12.m
% trazado de curvas mediante spline cubico
clc
clear all

y=[0 0 0 0 0 0 0 0 0 0 0  0.1:0.1:1      1 1 1 1 1 1 1 1 1 1           1:-0.1:0]
x=[0:0.1:1            1 1 1 1 1 1 1 1 1  1:-0.1:0    0 0 0 0 0 0 0 0 0 0 0]
p=1:length(x);   % Vector auxiliar ordenado crecientemente
pp=1:0.4:length(x);
xx=spline(p,x,pp);
yy=spline(p,y,pp);
plot(x,y,'o',xx,yy)
grid
% Agregar mas puntos para tenga forma cuadrado