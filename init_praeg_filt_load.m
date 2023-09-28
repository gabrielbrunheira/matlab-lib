function [sys_ss] = init_praeg_filt_load(sys_param, y_mode)

Vdc = sys_param.Vdc;

L = sys_param.L;
RL = sys_param.RL;
C = sys_param.C;
Cd = sys_param.Cd;
Rd = sys_param.Rd;

Ro = sys_param.Ro;
Lo = sys_param.Lo;

A = [-RL/L        0      -1/L         0;
       0     -1/(Cd*Rd)   1/(Cd*Rd)    0;
       1/C    1/(C*Rd)   -1/(C*Rd)   -1/C;
       0          0       1/Lo      -Ro/Lo];

B = [Vdc/L 0 0 0]';

if y_mode == 1
    C = [0 0 0 1];
    D = [0]; 
else
    C = [0 0 0 1;
         0 0 1 0];
     
	D = [0 0]'; 
end

sys_ss = ss(A,B,C,D);