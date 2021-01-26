% Algoritmo
clc
clear all
x=[1 2 4]   % 5
y=[2 10 7]  % 2
% x en [1,2]   S0(x)=a0*x^3+b0*x^2+c0*x+d0
% x en [2,4]   S1(x)=a1*x^3+b1*x^2+c1*x+d1
% Cond. Interpolacion
% S0(1)=2   S0(1)=a0*1^3+b0*1^2+c0*1+d0=2  (1)
% S0(2)=10  S0(2)=a0*2^3+b0*2^2+c0*2+d0=10 (2)
% S0(2)=S1(2)  a0*2^3+b0*2^2+c0*2+d0=a1*2^3+b1*2^2+c1*2+d1 (3)
% S1(4)=7   S1(4)=a1*4^3+b1*4^2+c1*4+d1=7  (4)
% Continuidad de la 1era derivada S0'(2)=S1'(2)  
% 3*a0*2^2+2*b0*2+c0=3*a1*2^2+2*b1*2+c1    (5)
% Continuidad de la 2da derivada S0"(2)=S1"(2)  
% 6*a0*2+2*b0=6*a1*2+2*b1                  (6)
% Tipo de Spline: 2 GDL
% a) Natural o Frontera Libre   s"(x0)=S"(xN)=0
% b) Forzado o Frontera Sujeta  s'(x0)=A   S'(xN)=B
% Eleginos spline natural
% s0"(1)=0   6*a0*1+2*b0=0
% S1"(4)=0   6*a1*4+2*b1=0
M=[1 1 1 1 0 0 0 0
   8 4 2 1 0 0 0 0 
   8 4 2 1 -8 -4 -2 -1
   0 0 0 0 64 16 4 1
   12 4 1 0 -12 -4 -1 0
   12 2 0 0 -12 -2  0 0
   6 2 0 0 0 0 0 0
   0 0 0 0 24 2 0 0]
N=[2 10 0 7 0 0 0 0]'  

c=M\N   % a0 b0 c0 d0 a1 b1 c1 d1
syms z
S0=c(1)*z^3+c(2)*z^2+c(3)*z+c(4)
S1=c(5)*z^3+c(6)*z^2+c(7)*z+c(8)
% Aproximar y(1.2)
xi=1.2
yi=subs(S0,xi)
yi=double(yi)
% Verificando condiciones
subs(S0,1), subs(S0,2), subs(S1,2), subs(S1,4)
x1=1:0.1:2; x2=2:0.1:4; 
y1=subs(S0,x1); y2=subs(S1,x2);   
plot(x1,y1,x2,y2), grid
% Ejercicio :  Agregar (5,2)
% Aplicar spline forzado S'(1)=1     S'(4)=-1