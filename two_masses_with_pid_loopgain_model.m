clear all 
close all
clc

p_r1 = 2*pi*3;
csi_r1 = 0.001;

p_r2 = 2*pi*500;
csi_r2 = 0.01;

z_pid = 2*pi*30;
p_pid = 2*pi*300;


K = db2mag(9)*2e9;

Gs = K* tf(1, [1 0])
Gs = Gs*tf([1 2*z_pid z_pid^2],1)
Gs = Gs*tf(1, [1 2*csi_r1*p_r1 p_r1^2])
Gs = Gs*tf(1, [1 2*csi_r2*p_r2 p_r2^2])
Gs = Gs*tf(p_pid, [1 p_pid])


figure
margin(Gs)


figure
plotoptions= nyquistoptions('cstprefs') ;   % default options
plotoptions.ShowFullContour = 'off';        % exclude negative frequencies
nyquist(Gs,plotoptions)
