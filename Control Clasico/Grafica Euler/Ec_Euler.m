clear all; clc; close all;
R = [0.5,0.4,0.3]';
C = 2;
h  = [0 0 0]';
dh = 0;
qi = input('Inserte el qi: ');
dt = 0.001;
tf = 15;
t = (0);
i = 1;

%
%   qo = h/R  -->   Qo(s) = H(s)/R  --> H(s) = Qo(s)*R
%   
%   C*dh/dt = qi-qo
%   
%   C*H(s)*s = Qi(s)-Qo(s)
%   
%   RC*Qo(s)*s = Qi(s)-Qo(s)
%   Qo(s)*(RC*s+1) = Qi(s)
%   
%   Qo(s)/Qi(s) = 1/(RC*s+1)
%   
%   C*H(s)*s = Qi(s)-H(s)/R
%   H(s)*(RC*s+1)=Qi(s)*R
%   
%   H(s)/Qi(s) = R/(RC*s+1)

v = [0 20 0 10];
axis(v);
axis square;
title('Curva');
grid on;
hold on;
%legend('A','B');

while(t <= tf)
    dh = ((R*qi - h(i))./(R*C))*dt;
    h(:,i+1) = h(:,i) + dh;
    t(i+1) = t(i) + dt;
    i = i + 1;
end

plot(t,h);

%{
ct = ["Hola1"    "Hola2"    "Hola3"];
%h=[h;h*2;h*3];

color=[0 0 0;
       0 0 1;
       0 1 0;
       0 1 1;
       1 0 0;
       1 0 1;
       1 1 0;
       1 1 1];

for i=1:3
    A(i) = animatedline('DisplayName',ct(i),'Color',color(i,:));
end
legend;

for k = 1:10:length(t)
    for i=1:3
        addpoints(A(i),t(k),h(i,k));
    end
    drawnow
end
%}