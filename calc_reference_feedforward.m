function [num, den, Fz, Fs] = calc_reference_feedforward(vdc, r_load, l_load, f_cut, ts)

% Feedforward projetado usando modelo simplificado do sistema (carga)
% com frequência de corte 1 década abaixo da taxa de amostragem da curva

Gs = tf(vdc,[l_load r_load]);

Fs = 1/(Gs)*tf(2*pi*f_cut,[1 2*pi*f_cut]);
Fz = c2d(Fs,ts,'tustin');

figure();
bode(Gs,Fs,Fz);
legend('G(s)','F(s)','F(z)');
grid on;

num = Fz.num{1};
den = Fz.den{1};