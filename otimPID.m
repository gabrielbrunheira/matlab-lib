function [J, RiseTime, Overshoot, maxU] = otimPID(K,Gs)

Q = [1 1 1 1];

%% Define sistema
R = 10e3;
C = 150e-9;
%Gs = tf(1,[R*C 1]);

%% Projeta controlador
Ds = tf([K(1) K(2)],[1 0]);

%% Sistema em malha fechada
Ts = feedback(Ds*Gs,1);
Us = feedback(Ds,Gs);

[ystep,t] = step(Ts);
S = stepinfo(ystep,t,dcgain(Ts));
ustep = step(Us);

RiseTime = S.RiseTime;
Overshoot = S.Overshoot;
maxU = max(ustep);

%J = sqrt(Q*[S.RiseTime^2 S.Overshoot^2 maxU^2]');
J = sqrt(Q*[RiseTime^2 Overshoot^2 maxU^2 sum((ystep-1).^2)/length(ystep)]');