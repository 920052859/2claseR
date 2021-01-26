% programa11.m
% Interpolacion segmentaria cubica
clc
clear all
n=input('Numero de particiones, N=')
x=0:2/n:2; % ordenado creciente
y=sin(x);
xx=0:0.01:2;
yy=interp1(x,y,xx,'spline');
ye=sin(xx);
plot(x,y,'*',xx,yy,'r',xx,ye,'g')
grid
legend('Data','Spline Cubico','Sen(x)')
max_err=max(abs(ye-yy))