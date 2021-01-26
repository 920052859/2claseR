clc;
clear all;
close all;
tf = 2;
t = 0:0.25:5*tf;
T = input('Inserte el valor del par T: ');
K = input('Inserte la ganancia K del cont.prop: ');
J = input('Inserte el valor de la inercia J: ');
B = input('Inserte el valor de la fricción B: ');

%Respuesta escalon unitario 2do orden
%C(S)/R(S)=K/(J*s^2+B*s+K)
%K/J=wn^2
%B/J=2*L*wn=2*delta (atenuación)
%B_crit=2*sqrt(J*K)
%L = B/B_crit=B/(2*sqrt(J*K))

%C(S)/R(S)=wn^2/(s^2*L*wn*s+wn^2)

wn = (K/J)^0.5;
Bc = 2*(J*K)^0.5;
L = B/Bc;
delta = L*wn;

fprintf('\nAtenuación (delta) = %5.2f\n',delta);
fprintf('Frec.nat no amort.(wn) = %5.2f\n',wn);
fprintf('Factor de amort.rel.(L) = %5.2f\n\n',L);

pause(2);

if L>1
    fprintf('L>1:Sobreamortiguado\n');
    s1 = (L + (L^2-1)^2)*wn;
    s2 = (L - (L^2-1)^2)*wn;
    y = 1+(wn/(2*(L^2-1)^0.5))*((exp(-s1*t))/(s1)-(exp(-s2*t))/(s2));
elseif L == 1
    fprintf('L=1:Criticamente amortiguado\n');
    Y = 1 - exp(-wn*t)*(1+wn*t);
elseif L > 0
    fprintf('1>L>0:Submortiguado\n');
    wd = wn*(1-L^2)^0.5;
    y = 1 - (exp(-L*wn*t)/(1-L^2)^0.5).*sin(wd*t+atan((1-L^2)^0.5/L));
else
    fprintf('Nani');
end  
plot(t,y);