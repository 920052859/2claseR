clc, clear all
A=[4 -1 1;
   -1 4.25 2.75;
    1 2.75 3.5], b=[4 6 7.25]'
if A==A'
    disp('A es simetrica')
    m1=A(1:1,1:1), m2=A(1:2,1:2), m3=A(1:3,1:3)
    if det(m1)>0 & det(m2)>0 & det(m3)>0  % Silvester
        disp('A es definida positiva')
        disp('Choleski es aplicable')
        U=chol(A)  % Matlab aplica Cholesky
        L=U'
        AA=A-L*U  % debe ser igual una a matriz nula
        z=L\b   % L*z=b Sistema triangular inferior
        x=U\z   % U*x=z Sistema triangular superior
    else
        disp('A No es definida Positiva')
        disp('Choleski No es aplicable')
    end     
else    
    disp('A No es simetrica')
    disp('No es posible Choleski')
end 
