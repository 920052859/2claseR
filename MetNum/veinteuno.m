% clc
% clear all
% x=0:0.5:2
% y=sin(3*x)
% xx=0:0.1:2
% yy=interp1(x, y, xx,'linear')
% ye=sin(3*x);
% plot(x,y,'*',xx,yy,'d',xx,yy,xx,ye)
% grid
% legend('Data','Spline Linear1','Spline Lineal', 'Exacto')
% err_max=max(abs(ye-yy))


% programa10.m
% Interpolacion segmentaria lineal

clc
clear all
x=0:0.25:2
y=sin(3*x)
xx=0:0.1:2
yy=interp1(x,y,xx,'linear')
ye=sin(3*xx);
plot(x,y,'*',xx,yy,'d',xx,yy,xx,ye)
grid
legend('Data','Spline Lineal','Spline Lineal','Exacto')
err_max=max(abs(ye-yy))