clear all; clc; close all;
ct = string([]);
valor = input('Inserte los valores[]: ');
longitud = length(valor);
for n = 1:longitud
    R = valor(n);
    C = 2;
    
    h  = (0);
    dh = 0;
    
    qi = 5;
    dqi = 0;
    
    qo = (2);
    dqo = 0;
    
    t = (0);
    dt = 0.001;
    tf = 10;
    i = 1;
    
    while(t <= tf)
        dh = ((R*qi(i) - h(i))/(R*C))*dt;
        qo(i) = h(i)/R;
        h(i+1) = h(i) + dh;
        t(i+1) = t(i) + dt;
        qi(i+1) = qi(i) +dqi;
        qo(i+1) = qo(i) +dqo;
        i = i + 1;
    end
    y1(n,:) = qo;
    y2(n,:) = qi;
    y3(n,:) = h;
end
var=input('Nombre variable:','s');
for n = 1:longitud
    ct(n)=strcat(var,'=',string(valor(n)));
end

grid on;
hold on;
c1 = subplot(1,3,1);
plot(t,y1);
title('qo');
legend(c1,ct)

c2 = subplot(1,3,2);
plot(t,y2);
title('qi');
legend(c2,ct)

c3 = subplot(1,3,3); 
plot(t,y3);
title('h');
legend(c3,ct)
