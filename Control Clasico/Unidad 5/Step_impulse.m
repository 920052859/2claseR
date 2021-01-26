clc;clear all;
syms s;

ln = 0;
ld = 0;

NUM = input('Inserte el numerador(s):');
DEN = input('Inserte el denominador(s):');

if diff(NUM,s) ~= 0
    NUM = expand(NUM);
else
    NUM = sym(NUM);
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

s = input('Escalón(1) o impulso(2)?');
if(s == 1)
    step(num,den)
end
if(s == 2)
    impulse(num,den)
end


feedback