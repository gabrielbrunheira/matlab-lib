function [asd,freq] = plotASD(data,fs)

N = length(data);
xdft = fft(data);
xdft = xdft(1:N/2+1);
asd = (1/sqrt(fs*N)) * abs(xdft);
asd(2:end-1) = 2*asd(2:end-1);
freq = 0:fs/N:fs/2;

[psd,freq] = plotPSD(data,fs);
asd = sqrt(psd);

loglog(freq,asd)
grid on
title('Periodogram Using FFT')
xlabel('Frequency (Hz)')
ylabel('Amplitude/Frequency (units/sqrt((Hz)')