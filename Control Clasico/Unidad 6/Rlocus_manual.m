clc;
clear all;
close all;
syms s NUM DEN k;

%%G(s)*H(s) = K*num/den

NUM = input('Inserte el numerador(s): ');
DEN = input('Inserte el denominador(s): ');
if diff(NUM,s) ~= 0
    NUM = expand(NUM);
else
    NUM = sym(NUM);
end
num = sym2poly(NUM);

DEN = expand(DEN);
den = sym2poly(DEN);
ln = length(num);
ld = length(den);

if(ln<ld)
    for(i=1:ld-ln)
        num = [0 num];
    end
end

%asintotas
ceros = roots(num);
polos = roots(den);
n = length(polos);
m = length(ceros);
asintota(1)=180/(n-m);
asint(1) = asintota(1);
fprintf('asint: ± %4.4f, K = 0\n',asint(1));
for i=2:10
    asint(i)=180*(2*(i-1)+1)/(n-m);
    while asint(i) > 180
        asint(i) = asint(i)-360;
        asint(i) = abs(asint(i));
    end
    fin = 0;
    for j=1:i-1
        if asint(i) == asint(j)
            fin = 1;
        end
    end
    if fin == 1
        break;
    end
    fprintf('asint: ± %4.4f, K = %d\n',asint(i),i-1);
end

%Centroide:
fprintf('\nCentro:\n');
centro = 0;
fprintf('[');
for i=1:n
    centro = centro + polos(i);
    fprintf('+(%4.2f)',polos(i));
end
fprintf(']-[');
for i=1:m
    centro = centro - ceros(i);
    fprintf('+(%4.2f)',ceros(i));
end
fprintf(']\n');
fprintf('----------------------------\n');
fprintf('%d-%d\n\n',n,m);

centro = centro/(n-m);
fprintf('centroide: %4.4f\n\n',centro);

%Punto de quiebre
fprintf('G*H=\n');
pretty(NUM*k/DEN);

fprintf('\nK=\n\n');
pretty(-DEN/NUM);

k = -DEN/NUM;
difk = diff(k,s) == 0;
fprintf('\ndk/ds = \n\n');
pretty(difk);
rdifk = solve(difk,s);
rdifk = double(vpa(rdifk,4));

for i=1:length(rdifk)
    kq(i) = double(subs(k,s,rdifk(i)));
    fprintf('s = %4.4f+%4.4fj -> K = %4.4f+%4.4fj\n',real(rdifk(i)),imag(rdifk(i)),real(kq(i)),imag(kq(i)));
end

rlocus(num,den);

%Puntos de cruce con Im
Routh_rlocus;