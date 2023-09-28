clear all; close all; clc;

% Sampling frequency
Fs = 1000;
Ts = 1/Fs;

% Continuous PI controller
Kp = 0.1;
Ki = 2;


Kp = 0.000234;
Ki = 0.03465;

Ks = tf([Kp Ki],[1 0])

% Discretization methods
Kz_euler_backwads = tf([Kp+Ki*Ts -Kp],[1 -1],Ts)
Kz_euler_forward = tf([Kp -Kp+Ki*Ts],[1 -1],Ts)
Kz_tustin = c2d(Ks,Ts,'tustin')

%% Plots
figure()
subplot(1,2,1);
bode(Ks,Kz_euler_backwads,Kz_euler_forward,Kz_tustin);
legend('Ks','Back','Forward','Tustin');

subplot(1,2,2);
impulse(Ks,Kz_euler_backwads,Kz_euler_forward,Kz_tustin);