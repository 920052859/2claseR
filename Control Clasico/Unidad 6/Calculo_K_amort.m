clc;
clear all;
MZ = [];
MP = [];

VZ = [];
VP = [];

Z = input('Inserte el numero de ceros: ');
for i=1:Z
    fprintf('Cero N°%i\n',i);
    VZ = input('Inserte el punto: ');
    MZ = [MZ;VZ];
end

P = input('Inserte el numero de polos: ');
for i=1:P
    fprintf('Polo N°%i\n',i);
    VP = input('Inserte el punto: ');
    MP = [MP;VP];
end

tol = 1;
amort = input('Coef. amortiguamiento: ');
teta = acosd(amort);
cont = 1;
x = input('Inserte x: ');
while cont == 1 && tol>0.001
    y = x*tand(180-teta);
    AP = 0;
    AZ = 0;
    fprintf('Polos\n');
    for j = 1:P
        v = (x-MP(j,1))+(y-MP(j,2))*1i;
        v = angle(v)*180/pi;
        fprintf('Angulo polo (s+%i): %6.3f°\n',-MP(j,1),v);
        AP = v + AP;
    end
    fprintf('\nZeros\n');
    for j = 1:Z
        v = (x-MZ(j,1))+(y-MZ(j,2))*1i;
        v = angle(v)*180/pi;
        fprintf('Angulo zero (s+%i): %6.3f°\n',-MZ(j,1),v);
        AZ = v + AZ;
    end
    A = AZ-AP
    RA = A
    diffRA = round(abs(A)/180)
    while diffRA >= 1
        RA = RA - 180
        diffRA = round(abs(RA)/180)
    end
    RA = (180-RA)/180
    fprintf('\nRA: %6.3f\n',RA);
    fprintf('x antiguo: %6.3f\n',x);
    x = x*(1 + RA);
    fprintf('x nuevo: %6.3f\n',x);
    tol = abs(A)-round(abs(A)/180)*180;
    tol = abs(tol);
    fprintf('tol: %6.3f\n',tol);
    fprintf('Angulo total: %6.3f°\n',A);
    pause(1);
    %cont = input('\nContinuar? 1(Y), 0(N)\n');
end
fprintf('Angulo total: %6.3f°\n',A);

syms s;
fs = input('Inserte la función f(s) de K*f(s): ');
ss = x+y*1i;
K = subs(fs,s,(ss));
K = abs(1/double(K));
fprintf('Kp: %6.3f\n',K);



Nes = input('Inserte NUM de función E(s)/R(s): ');
Nfxes = vpa(expand(Nes),8);
Des = input('Inserte DEN de función E(s)/R(s): ');
Dfxes = vpa(expand(Des),8);

charnum = length(char((Nfxes)));
charden = length(char((Dfxes)));
maxchar = [charnum charden];

fprintf('          %s\n',char(Nfxes));
fprintf('E(s)/R(s):');
for i=1:max(maxchar)
    fprintf('—');
end
fprintf('\n          %s\n',char(Dfxes));


Dfxes = vpa(expand(Des*s),8);

charnum = length(char((Nfxes)));
charden = length(char((Dfxes)));
maxchar = [charnum charden];

fprintf('          %s\n',char(Nfxes));
fprintf('E(s)/R(s):');
for i=1:max(maxchar)
    fprintf('—');
end
fprintf('\n          %s\n',char(Dfxes));