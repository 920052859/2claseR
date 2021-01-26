% programa01.m
% Integracion Numerica
% Comandos propios del MATLAB
clc
clear all
format long
% Integral de polinomios
p=[3 2 1 8]      % p(x)=3*x^3+2*x^2+x+8
intp=polyint(p)  % I = 3/4*x^4+2/3*x^3+x^2/2+8*x+0
intp1=polyint(p,2)  % I = 3/4*x^4+2/3*x^3+x^2/2+8*x+2
IntDef=polyval(intp,1)-polyval(intp,0)
% Matematica simbolica
syms x
P=3*x^3+2*x^2+x+8
intp1=int(P)
Intp2=double(int(P,0,1))
% Uso de quad
f1=inline('3*x.^3+2*x.^2+x+8')
I1=quad(f1,0,1)
f2=inline('exp(-x.^3)')
I2=quad(f2,1,2)
I2=quad(f2,1,2,1e-16)
from ROBERT GERARDO CASTRO SALGUERO to everyone:    3:45 PM
% programa02.m
% Integracion mediante un polinomio interpolante
clc
clear all
syms z
f=sin(5*z)
Ie=double(int(f,0,2))
n=input('Numero de particiones=')
h=2/n
x=0:h:2;
y=double(subs(f,x))
p=polyfit(x,y,n)   % interpolacion polinomica
intp=polyint(p)
Iap=polyval(intp,2)-polyval(intp,0)
err=abs(Ie-Iap)
xx=0:0.01:2;
ye=double(subs(f,xx));
ya=polyval(p,xx);
plot(x,y,'d',xx,ye,'b',xx,ya)
grid, legend('Data','Exacta','Polinomica')
max_err=max(abs(ya-ye))
% n     err_Integral           max_err
% 2
% 3
% 4     0.384449445205502      1.007196146234290
% 5     0.189490379784984      0.629710861827257
% 6     0.061890195825233      0.265976077399058
% 7     0.035644926238054
% 8     0.035644926238054