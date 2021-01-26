syms K e M_routh s AsC2;
sym num;
fAs = input('Inserte R(s): ');
expand(fAs)
As = input('Inserte la matriz de coeficientes([]): ');
L_As = length(As);
C_As = 0;
F_As = 0;
P_Aux = 0;
iAux = 0;
for (i = 0:L_As-1)
    C_As = ceil((i+1)/2);
    F_As = mod(i,2)+1;
    M_routh(F_As,C_As) = As(i+1);
    if M_routh(F_As,1) == 0
        M_routh(F_As,1) = e;
    end
end
iAux = 3;
M_routh

C2 = input('La matriz cumple el caso 2? 1:Si,2:No: ');
if C2 == 1
    for (i = 1:L_As)
        if mod(i,2) == 1
            AsC2(i) = 0;
        else
            AsC2(i) = As(i);
        end
    end
P_Aux = poly2sym(AsC2,s);
P_Aux = diff(P_Aux,s);
AsC2 = sym2poly(P_Aux);
AsC2(AsC2==0) = [];
AsC2;
AsC2(1,ceil(L_As/2)) = 0;
M_routh(3,:) = AsC2;
iAux = 4;
end

    
for (i = iAux:L_As)
    for (j = 1:ceil(L_As/2)-1)
    M_routh(i,j)=(M_routh(i-1,1)*M_routh(i-2,j+1)-M_routh(i-2,1)*M_routh(i-1,j+1))/M_routh(i-1,1);
    if M_routh(i,1) == 0
        M_routh(i,1) = e;
    end
    end
end
M_routh

scruce = input('Funcion de s: ');
scruce = scruce == 0;

scruce = solve(scruce,s);
scruce = double(vpa(scruce,4))
%{
num = input('Inserte el numerador([]):');
ln = length(num);

if(ln<L_As)
    for(i=1:L_As-ln)
        num = [0 num];
    end
end

M_routh
step(num,As)
%}