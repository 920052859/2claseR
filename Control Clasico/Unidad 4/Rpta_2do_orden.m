clc;
clear all;
close all;
syms tsub ysym s;

%Respuesta escalon unitario 2do orden
%C(S)/R(S)=K/(J*s^2+B*s+K)
%K/J=wn^2
%B/J=2*L*wn=2*delta (atenuación)
%B_crit=2*sqrt(J*K)
%L = B/B_crit=B/(2*sqrt(J*K))

%C(S)/R(S)=wn^2/(s^2*L*wn*s+wn^2)

wn = input('Frec.nat no amort.(wn): ');
L = input('Factor de amort.rel.(L): ');
delta = wn*L;
fprintf('Atenuación: %4.2f\n',delta);

tf = 5/(wn*L);
t = 0:0.001:2*tf;

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
    fprintf('Wd = %s = %4.2f\n',"wn*(1-L^2)^0.5",wd);
    y = 1 - (exp(-L*wn*t)/(1-L^2)^0.5).*sin(wd*t+atan((1-L^2)^0.5/L));
    ysym = 1 - (exp(-L*wn*tsub)/(1-L^2)^0.5)*sin(wd*tsub+atan((1-L^2)^0.5/L));
    beta = acos(L);
    teta = acosd(L);
    fprintf('beta = %s = %4.2f°\n',"acos*(L)",teta);
    tr = (pi-beta)/wd;
    fprintf('tr:\n');
    pretty(str2sym("(api-beta)/wd"));
    tp = pi/wd;
    fprintf('tp:\n');
    pretty(str2sym("pi/wd"));
    ts2 = 4/(wn*L);
    fprintf('ts2:\n');
    pretty(str2sym("4/(wn*L)"));
    ts5 = 3/(wn*L);
    fprintf('ts5:\n');
    pretty(str2sym("3/(wn*L)"));
    tsp = 4.6/(wn*L);
    fprintf('tsp:\n');
    pretty(str2sym("4.6/(wn*L)"));
    Mp = exp(-pi*(delta/wd));
    fprintf('tr: %4.2f -> y(tr)=%4.2f\n',tr,double(subs(ysym,tsub,tr)));
    fprintf('tp: %4.2f -> y(tp)=%4.2f\n',tp,double(subs(ysym,tsub,tp)));
    fprintf('ts(2): %4.2f -> y(ts(2))=%4.2f\n',ts2,double(subs(ysym,tsub,ts2)));
    fprintf('ts(5): %4.2f -> y(ts(5))=%4.2f\n',ts5,double(subs(ysym,tsub,ts5)));
    fprintf('ts(pr): %4.2f -> y(ts(pr))=%4.2f\n',tsp,double(subs(ysym,tsub,tsp)));
    fprintf('Mp: %4.2f\n',Mp);
else
    fprintf('Nani');
end

hold on;
vmax = max(max(y)');
color=[0 0 0;
       0 0 1;
       0 1 0;
       0 1 1;
       1 0 0;
       1 0 1;
       1 1 0;
       1 1 1];

ct = "2do orden";
v = [0 max(t)*1.1 0 vmax*1.5];
axis(v);
A = animatedline('DisplayName',ct,'Color',color(4,:));
legend;

for k = 1:5:length(t)
    addpoints(A,t(k),y(k));
    drawnow
end

plot(t,y);

NUM = wn^2;
DEN = s^2 + 2*L*wn*s+wn^2;

NUM = sym(NUM);
num = sym2poly(NUM);
DEN = expand(DEN);
den = sym2poly(DEN);

step(2*num,den);