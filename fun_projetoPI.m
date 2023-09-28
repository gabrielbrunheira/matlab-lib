function F = fun_projetoPI(x)

global wcl phm AmpFreqResp AngleFreqResp

GainFcut = 1;
GainPhaseMargin = 1;

F = [(sqrt(x(1)^2*wcl^2 + x(2)^2)/wcl*AmpFreqResp - 1)*GainFcut;
     (x(2)/x(1) - wcl/tan(pi/2 + phm*pi/180 - AngleFreqResp))*GainPhaseMargin];