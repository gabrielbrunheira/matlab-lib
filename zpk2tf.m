function [tf_s, num, den] = zpk2tf(zpk_s)

[num, den] = zp2tf(zpk_s.Z{1}, zpk_s.P{1}, zpk_s.K);
tf_s = tf(num,den);
