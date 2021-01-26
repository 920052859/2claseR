clc;
clear all;
close all;
T = 1;
t = 0:0.01:5*T;

%Respuesta escalon unitario 1er orden
y1 = 1-exp(-t/T);

%Respuesta rampa unitaria 1er orden
y2 = t-T*(1-exp(-t/T));
e2 = T*(1-exp(-t/T));

%Respuesta impulso unitario 1er orden
y3 = 1/T*(exp(-t/T));

f1 = [y1;y2;y3];
f2 = [y1;y2;e2;y3];
hold on;
grid on;

ct = ["escalon"  "rampa"  "impulso"];
vmax = max(max(f1)');
color=[0 0 0;
       0 0 1;
       0 1 0;
       0 1 1;
       1 0 0;
       1 0 1;
       1 1 0;
       1 1 1];

for i=1:3
    %subplot(2,1,i);
    v = [0 max(t)*1.1 0 vmax*1.5];
    axis(v);
    A(i) = animatedline('DisplayName',ct(i),'Color',color(i,:));
    %legend(ct(i));
end
legend;

for k = 1:1:length(t)
    for i=1:3
        addpoints(A(i),t(k),f1(i,k));
    end
    drawnow
end