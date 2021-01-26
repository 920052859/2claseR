clc;
clear all;
close all;
T = 2;
t = 0:0.25:5*T;

%Respuesta escalon unitario 1er orden
y1 = 1-exp(-t/T);

%Respuesta rampa unitaria 1er orden
y2 = t-T*(1-exp(-t/T));
e2 = T*(1-exp(-t/T));

%Respuesta impulso unitario 1er orden
y3 = 1/T*(exp(-t/T));

y = [y1;y2;e2;y3];

hold on;
grid on;
plot(t,y);