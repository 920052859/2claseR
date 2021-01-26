clc
clear all
%h = ha + dt*((r*qia))
R = 10;
C = 4;
qi0 = 2;
qo0 =2;
dt = 0.0001;
tmax = 20;
t0 = 0;
h0 = 0;

n = (tmax - t0)/dt;

t=[t0];
h = [h0];
qi = [qi0];
qo = [qo0];

for i=1:n
    % Modelo
    t(1+i) = t(i)+dt;
    h(i+1)=h(i) +((R*qi(i)-h(i))./R*C)*dt;
    qo(i+1)=h(i)/R;
    qi(i+1)=qi(i);
    
end

subplot(1,3,1)
plot(t,qi)
title('Caudal de ingreso')
xlabel('Tiempo (seg)')
ylabel('caudal m**3/s)')


subplot(1,3,2)
plot(t,qo)
title('Caudal de ingreso')
xlabel('Tiempo (seg)')
ylabel('caudal m**3/s)')


subplot(1,3,3)
plot(t,h)
title('Caudal de ingreso')
xlabel('Tiempo (seg)')
ylabel('caudal m**3/s)')





















