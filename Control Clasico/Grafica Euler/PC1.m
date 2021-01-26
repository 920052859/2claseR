clear all; clc; close all;
%%Constantes
K = 30.03e-3;
j = 1.9e-6;
L = 4.3e-2;
R = 6.5;
V = 15;

%%Variables
i = (0);
w = (0);

%%Variaciones
di = 0;
dw = 0;
dt = 0.1;
tf = 10;
t = (0);
n = 1;

while(t(n) <= tf)
    dw = ((K*i(n))/j)*dt;
    di = ((V-i(n)*R-K*w(n))/L)*dt;
    i(n+1) = i(n) + di;
    w(n+1) = w(n) + dw;
    t(n+1) = t(n) + dt;
    n = n + 1;
    
end
grid minor;
hold on;
plot(t,i,'DisplayName','i vs t');
plot(t,w,'DisplayName','w vs t');
legend;