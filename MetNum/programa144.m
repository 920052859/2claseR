% programa14.m
% Spline natural definido por el usuario
% Algoritmo
clc, clear all, x=[1 2 4 5],y=[2 10 7 2],n=length(x)
dh=x(2:n)-x(1:n-1)  % calculo de hi
yp=(y(2:n)-y(1:n-1))./dh % diferencias divididas de 1er orden
a=2*(dh(1:n-2)+dh(2:n-1))  % diagonal
b=dh(2:n-2) % diagonal desplazada
%1er orden
a=2*(dh(1:n-2)+dh(2:n-1))  % diagonal
b=dh(2:n-2) % diagonal desplazada
TD=diag(a)+diag(b,1)+diag(b,-1)  % Matriz tridiagonal
VC=6*(yp(2:n-1)-yp(1:n-2))'   % Vector derecho
VS=TD\VC  % Contiene los M intermedios
M=[0 VS' 0]   % Vector M completo Mi=S"(xi)
% Calculo de los coefientes
a=(M(2:n)-M(1:n-1))./(6*dh)
b=M(1:n-1)/2
c=yp-dh/6.*(2*M(1:n-1)+M(2:n))
d=y(1:n-1)
syms z
S0=a(1)*(z-1)^3+b(1)*(z-1)^2+c(1)*(z-1)+d(1)
S1=a(2)*(z-2)^3+b(2)*(z-2)^2+c(2)*(z-2)+d(2)
S2=a(3)*(z-4)^3+b(3)*(z-4)^2+c(3)*(z-3)+d(3)
subs(S0,1),subs(S0,2),subs(S1,2),subs(S1,4)
s0=expand(S0)
s1=expand(S1)
s2=expand(S2)
% Comprobar al condicion de spline natural
v1=subs(diff(diff(s0)),1)   % 0
v2=subs(diff(diff(s2)),5)   % 0
% comprobar las demas condiciones del spline
% y graficar
xi=input('xi=')
if xi>=1 && xi<=2
  e=double(subs(s0,xi))
elseif  xi>=2 && xi<=4   
  e=double(subs(s1,xi))
elseif xi>=4 && xi<=5    
  e=double(subs(s2,xi))
else
  disp('Fuera de Rango!!!')
end  
