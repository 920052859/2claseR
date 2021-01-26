clc;
clear all;
syms k b Bt Bv M1 M2 NUM DEN s;  
A = input('Inserte la matriz A: ');
B = input('Inserte la matriz B: ');
C = input('Inserte la matriz C: ');
D = input('Inserte la matriz D: ');

G = C*inv(s*eye(4)-A)*B+D;
while i ~= 0
    i = input('Que rpta desea?: ');
    if i ~= 0
        [GNUM GDEN] = numden(G(i));

        charnum = length(char(collect(GNUM)));
        charden = length(char(collect(GDEN)));
        maxchar = [charnum charden];
        fprintf('G(%i):\n',i);

        %POSITIVO
        if charnum<charden
            for j = 1:(charden-charnum)/2
               fprintf(' ');
            end
        end
        fprintf('%s\n',char(collect(GNUM)));
        for j = 1:max(maxchar)
            fprintf('—');
        end
        fprintf('\n');
        if charden<charnum
            for j = 1:(charnum-charden)/2
               fprintf(' ');
            end
        end
        fprintf('%s\n',char(collect(GDEN)));

        fprintf('\n\n');

        %{
        %NEGATIVO
        if; charnum<charden
            for j = 1:(charden-charnum)/2
               fprintf(' ');
            end
        end
        fprintf('%s\n',char(collect(-1*GNUM)));
        for j = 1:max(maxchar)
            fprintf('—');

        end
        fprintf('\n');
        if charden<charnum
            for j = 1:(charnum-charden)/2
               fprintf(' ');
            end
        end
        fprintf('%s\n\n',char(collect(-1*GDEN)));
        %}
        
        fprintf('\n\n');
    end
end