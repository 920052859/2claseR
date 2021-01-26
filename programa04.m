% Programa7.m
% Criterio de Convergencia del Radio Espectral
% Sea el metodo iterativo x=T*x+C
% Es convergente si y solo si
% RadioEspectral(T)<1
clc
clear all
A=[4 -1 1;
   -1 4.25 2.75;
    10 2.75 3.5]
D=diag(diag(A))
L=D-tril(A)
U=D-triu(A)
Tg=(D-L)^-1*U
Tj=D^-1*(L+U)
rhoJ=max(abs(eig(Tj)))  % eig : valores propios
rhoG=max(abs(eig(Tg)))
if rhoJ<1
    disp('Converge para Jacobi')
else    
    disp('Diverge para Jacobi')
end    
if rhoG<1
    disp('Converge para Gauss-Seidel')
else    
    disp('Diverge para Gauss-Seidel')
end   
% Probar para A=[1   3; 4 1]