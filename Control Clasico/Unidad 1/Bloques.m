clc;
clear all;
close all;
syms G1 G2 G3 G4 G5 G6 G7 G8;
syms H1 H2 H3 H4 H5 H6 H7 H8;
syms NUM DEN B s k;
i = 1;
exit = 0;
B(i) = 0;
BGNUM = 0;
BGDEN = 0;
charnum = 0;
charden = 0;
G = 0;
H = 0;

while exit == 0
    formula = input('Multiplicar(1) o retroalimentación?(2): ');
    if formula == 1
        G = input('Inserte G1 de G1xG2=GP: ');
        H = input('Inserte G2 de G1xG2=GP: ');
        B(i) = G*H;
    end
    if formula == 2
        signo = input('Retroalimentación positiva(+1) o negativa(-1)?: ');
        G = input('Inserte G(superior): ');
        H = input('Inserte H(retroalimentación): ');
        B(i) = G/(1-signo*G*H);
    end
    [BGNUM BGDEN] = numden(B(i));
    expand(BGNUM);
    expand(BGDEN);
    charnum = length(char(expand(BGNUM)));
    charden = length(char(expand(BGDEN)));
    maxchar = [charnum charden];
    fprintf('B(%i):\n',i);
    
    %POSITIVO
    if charnum<charden
        for j = 1:(charden-charnum)/2
           fprintf(' ');
        end
    end
    fprintf('%s\n',char(expand(BGNUM)));
    for j = 1:max(maxchar)
        fprintf('—');
    end
    fprintf('\n');
    if charden<charnum
        for j = 1:(charnum-charden)/2
           fprintf(' ');
        end
    end
    fprintf('%s\n',char(expand(BGDEN)));
    
    fprintf('\n\n');
    
    %NEGATIVO
    if charnum<charden
        for j = 1:(charden-charnum)/2
           fprintf(' ');
        end
    end
    fprintf('%s\n',char(expand(-1*BGNUM)));
    for j = 1:max(maxchar)
        fprintf('—');
        
    end
    fprintf('\n');
    if charden<charnum
        for j = 1:(charnum-charden)/2
           fprintf(' ');
        end
    end
    fprintf('%s\n\n',char(expand(-1*BGDEN)));

    exit = input('Terminar? Si(1) No(0)');
    i = i + 1;
end
B(i-1);
%}
[BGNUM BGDEN] = numden(B(i-1));
expand(BGDEN);
fprintf('Bloque global\n');
    expand(BGNUM);
    expand(BGDEN);
    charnum = length(char(expand(BGNUM)));
    charden = length(char(expand(BGDEN)));
    maxchar = [charnum charden];
    %POSITIVO
    if charnum<charden
        for j = 1:(charden-charnum)/2
           fprintf(' ');
        end
    end
    fprintf('%s\n',char(expand(BGNUM)));
    for j = 1:max(maxchar)
        fprintf('—');
    end
    fprintf('\n');
    if charden<charnum
        for j = 1:(charnum-charden)/2
           fprintf(' ');
        end
    end
    fprintf('%s\n',char(expand(BGDEN)));
    
    fprintf('\n\n');
    %NEGATIVO
    if charnum<charden
        for j = 1:(charden-charnum)/2
           fprintf(' ');
        end
    end
    fprintf('%s\n',char(expand(-1*BGNUM)));
    for j = 1:max(maxchar)
        fprintf('—');
    end
    fprintf('\n');
    if charden<charnum
        for j = 1:(charnum-charden)/2
           fprintf(' ');
        end
    end
    fprintf('%s\n\n',char(expand(-1*BGDEN)));

%{
NUM = input('Inserte el numerador(s): ');
DEN = input('Inserte el denominador(s): ');
if diff(NUM,s) ~= 0
    NUM = expand(NUM);
    num = sym2poly(NUM);
else
    num = [NUM];
end
DEN = expand(DEN);


den = sym2poly(DEN);
ln = length(num);
ld = length(den);

if(ln<ld)
    for(i=1:ld-ln)
        num = [0 num];
    end
end

grid on;
hold on;

subplot(2,1,1);
v = [-6 6 -6 6];
axis(v);
axis square
sgrid;
rlocus(num,den);

subplot(2,1,2);
step(num,den);
%}