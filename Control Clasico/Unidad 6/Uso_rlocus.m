clc;
clear all;
close all;
syms s NUM DEN;

%                     +-----+
%         ---->O----->|  G  |----+---->
%             -|      +-----+    |
%              |                 |
%              |      +-----+    |
%              +------|  H  |<---+
%                     +-----+


%%G(s)*H(s) = K*num/den



NUM = input('Inserte el numerador(s): ');
DEN = input('Inserte el denominador(s): ');
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

grid on;
hold on;

subplot(2,1,1);
v = [-500 500 -500 500];
axis(v);
axis square;
rlocus(num,den);

subplot(2,1,2);
step(num,den);
