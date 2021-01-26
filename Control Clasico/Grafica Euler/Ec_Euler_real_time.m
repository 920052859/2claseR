clear all; clc; close all;
tR = [1,2,3]';
R = 1;
C = 2;
th  = [0 0 0]';
h  = 0;
tdh = [0 0 0]';
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

title('Curva');
grid on;

while(t <= tf)
    tdh(:,i) = ((tR*qi - th(:,i))./(tR*C))*dt;
    th(:,i+1) = th(:,i) + tdh(:,i);
    %dh = ((R*qi - h(i))/(R*C))*dt;
    %h(i+1) = h(i) + dh;
    t(i+1) = t(i) + dt;
    i = i + 1;
end

ct = ["Hola1"    "Hola2"    "Hola3"];


color=[0 0 0;
       0 0 1;
       0 1 0;
       0 1 1;
       1 0 0;
       1 0 1;
       1 1 0;
       1 1 1];

hold on;
vmax = max(max(th)');

for i=1:3
    subplot(3,1,i);
    v = [0 tf*1.1 0 vmax*1.5];
    axis(v);
    A(i) = animatedline('DisplayName',ct(i),'Color',color(i,:));
    legend(ct(i));
end
legend;

for k = 1:20:length(t)
    for i=1:3
        addpoints(A(i),t(k),th(i,k));
    end
    drawnow
end
