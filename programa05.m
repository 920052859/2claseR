clc
clear all
A=[2 -1 0
   -1 2 -1
   0 -1 2]
p=poly(A)  % Polinomio caracteristico
           % p(L)=det(A-L*I)
           % 1.0000   -6.0000   10.0000   -4.0000
           % p(L)=L^3-6*L^2+10*L-4
Espectro1=roots(p)  % Raices de p(L)=0 
           %  L1=3.4142  L2=2.0000  L3=0.5858
Espectro2=eig(A)  % Valores propios de A     
           % 0.5858   2.0000   3.4142
[P,D]=eig(A)   % P : contiene vectores propios en columnas
               % D : contien en su diagonal valores propios
% L2=2  ==> (A-L2*I)X2=0   SHCI Hallar X no nulo 
% (A-2I)X2=0
%  0 -1  0   a     0     -b=0             a       1
% -1 0  -1   b  =  0     -a-c=0      X2 = 0  = a  0     , a no nulo
%  0 -1  0   c     0     -b=0             -a      -1
% Matlab usa norma 2, el vector entre su modulo
% X2=[1/sqrt(2)  0  -1/sqrt(2)] o [-1/sqrt(2)  0  1/sqrt(2)]
XX2=P(:,2)
LL2=D(2,2)
% Definicion A*Xi=Li*Xi   o (A-Li*I)Xi=0
f=(A-LL2*eye(3))*XX2    % debe ser cero o cercano