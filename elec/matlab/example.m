% PID example

clear all
clc

num = [1];
denom = [1 3 1];

G = tf(num, denom);
H = [1];

for i = 1:1:10
    kp = i;
    kd = 0;
    ki = 0;
    PID = pid(kp, ki, kd);
    M_PID = feedback(G*PID, H);
    step(M_PID, 15)
    hold on
end

% for j = 0: +5: 50
%     kp = 100;
%     kd = j;
%     ki = 2;
%     PID = pid(kp, ki, kd);
%     M_PID = feedback(G*PID, H);
%     step(M_PID, 5)
%     hold on
% end

% for k = 0: +1: 10
%     kp = 10;
%     kd = 0;
%     ki = k;
%     PID = pid(kp, ki, kd);
%     M_PID = feedback(G*PID, H);
%     step(M_PID, 15)
%     hold on
% end

hold off
