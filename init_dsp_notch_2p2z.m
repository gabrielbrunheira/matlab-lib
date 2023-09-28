function [num,den] = init_dsp_notch_2p2z(alpha, freqCut, freqSample)

b = cos(2*pi*freqCut/freqSample);

num = [0 0 0];
den = num;

num(1) = (1+alpha)/2;
num(2) = -b*(1+alpha);
num(3) = num(1);
den(1) = 1;
den(2) = num(2);
den(3) = alpha;
