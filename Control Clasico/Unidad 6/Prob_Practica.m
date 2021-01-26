%   
%   dw/dt = ki/j
%   di/dt = (1/L)*(V-iR-kw)
%   
%   V entrada
%   w salida
%   i corriente
%   k,h,R,L ctes
%   
%   Laplace:
%   W(s)*s = K*I(s)/j -->  I(s) = j*s*W(s)/k
%   
%   I(s)*s = 1/L*(V(s)-R*I(s)-k*W(s))
%   
%   Ls*I(s) = V(s)-R*I(s)-k*W(s)
%   I(s)*(Ls+R) = V(s)-k*W(s)
%   (Ls+R)*j*s*W(s)/k = V(s)-k*W(s)
%   W(s)*[(Ls+R)*j*s/k + k) = V(s)
%   W(s)*[(Ls+R)*j*s + k^2)] = V(s)*k
%   
%                        k
%  W(s)/V(s) =     ______________
%   
%                 Lj*s^2+Rj*s+k^2
%   
%                        k/Lj
%  W(s)/V(s) =     ______________
%   
%                 *s^2+(R/L)*s+k^2/Lj





clc;clear all;close all;

syms s k j L R;


ln = 0;
ld = 0;

k = 30.03e-3;
j = 1.9e-6;
L = 4.3e-2;
R = 6.5;

NUM = input('Inserte el numerador(s):');
DEN = input('Inserte el denominador(s):');




if diff(NUM,s) ~= 0
    NUM = expand(NUM);
    num = sym2poly(NUM);
else
    num = [NUM];
end
DEN = expand(DEN);

den = sym2poly(DEN);
ln = length(num);
ld = length(den);

if(ln<ld)
    for(i=1:ld-ln)
        num = [0 num];
    end
end

Entrada = input('Escalón(1) o impulso(2)?');
grid on;
hold on;

if(Entrada == 1)
    step(num,den)
end
if(Entrada == 2)
    impulse(num,den)
end