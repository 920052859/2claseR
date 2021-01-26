num=[0 2 1];
den=[1 1 1 0];
t=0:0.1:10;
c=step(num,den,t);
plot(t,c,'o',t,t,'-')
grid
title('Respuestas')
xlabel('Tiempo')
ylabel('Entrada y Salida')