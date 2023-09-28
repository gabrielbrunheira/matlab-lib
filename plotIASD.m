function [iasd,freq] = plotIntASD(data,fs)
% 
[asd,freq] = plotASD(data,fs);

dfreq = mean(freq(2:end)-freq(1:end-1));

% N = length(data);
% xdft = fft(data);
% xdft = xdft(1:N/2+1);
% asd = (1/sqrt(fs*N)) * abs(xdft);
% %asd = (1/sqrt(fs*N)) * xdft;
% asd(2:end-1) = 2*asd(2:end-1)
% freq = 0:fs/N:fs/2;

iasd = zeros(size(asd));
iasd(1) = asd(1)*dfreq;

for f = 2:length(freq)
    iasd(f) = sqrt( (asd(f)*dfreq)^2 + iasd(f-1)^2);
end    

plotyy(freq,asd,freq,iasd);
grid on
title('Periodogram Using FFT')
xlabel('Frequency (Hz)')
ylabel('Amplitude/Frequency (units/sqrt((Hz)')