clc;
clear all;
close all;
a = input('Ingrese el cambio at + b: a = ');
b = input('Ingrese el cambio at + b: b = ');
x = [];
i = 1;
tt = -10:0.1:10;
for t = tt
    t = a*t + b;
    if 0 <= t && t <= 1
        x(i) = t;
    elseif 1 < t && t <= 2       
        x(i) = -t + 2;
    else
        x(i) = 0;
    end
    i = i + 1;
end

plot(tt,x,'r')