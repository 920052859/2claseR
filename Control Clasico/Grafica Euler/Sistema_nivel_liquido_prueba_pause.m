clear all; clc; close all;

grid on;
hold on;

for n = 1:5
    R = 1*n;
    C = 2;

    h  = (0);
    dh = 0;

    qi = 5;
    dqi = 0;

    qo = (2);
    dqo = 0;

    t = (0);
    dt = 0.001;
    tf = 20;
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
    c1 = subplot(3,1,1);
    plot(t,y1);
    title('qo');
    legend(c1,{'R = 1','R = 2','R = 3','R = 4','R = 5'})
    
    c2 = subplot(3,1,2);
    plot(t,y2);
    title('qi');
    legend(c2,{'R = 1','R = 2','R = 3','R = 4','R = 5'})
    
    c3 = subplot(3,1,3);
    plot(t,y3);
    title('h');
    legend(c3,{'R = 1','R = 2','R = 3','R = 4','R = 5'})
