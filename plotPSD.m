function [psd,freq] = plotPSD(data,fs)

N = length(data);
xdft = fft(data);
xdft = xdft(1:N/2+1);
psd = (1/(fs*N)) * abs(xdft).^2;
psd(2:end-1) = 2*psd(2:end-1);
freq = 0:fs/N:fs/2;

%plot(freq,psd)
loglog(freq,psd);
grid on
%title('Periodogram Using FFT')
xlabel('Frequency (Hz)')
ylabel('Power/Frequency [units/(Hz)]')