A=[4 -1 1;-1 4.25 2.75;1 2.75 3.5], b=[4 6 7.25]'
% Forma Escalar
% 4 x1 -x2 + x3 = 4
% -x1+4.25 x2 + 2.75 x3 =6
% x1 + 2.75 x2 + 3.5 x3 = 7.25
x1=0, x2=0, x3=0  % Inicializando
acum=[x1 x2 x3 NaN]; TOL =1e-6;
itera=0
for i=1:1000
    x1n=(4+x2-x3)/4;
    x2n=(6+x1n-2.75*x3)/4.25;
    x3n=(7.25-x1n-2.75*x2n)/3.5;
    x1n=(4+x2n-x3n)/4;
    x2n=(6+x1n-2.75*x3n)/4.25;
    err=norm([x1n-x1, x2n-x2, x3n-x3],Inf);
    acum=[acum; x1n x2n x3n err];
    itera=itera+1;
    if err<TOL
        break
    end    
    x1=x1n; x2=x2n; x3=x3n;
end    
disp('x1         x2            x3                err')
disp(acum)
NumIte=x1
itera