function [] = plotFFT(data,fs)

L = length(data);

f = fs*(0:(L/2))/L;

Y = fft(data);

mag_double_sided = abs(Y/L);
mag_single_sided = mag_double_sided(1:L/2+1);
mag_single_sided(2:end-1) = 2*mag_single_sided(2:end-1);
mag_dB = 20*log10(mag_single_sided);

for i = 1:length(mag_dB)
    if mag_dB(i) == -Inf
        mag_dB(i) = -400;
    end
end

%plot(f,mag_dB);
semilogx(f,mag_dB);
%plot(f,mag_single_sided);
grid on
%title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('Freq [Hz]')
ylabel('FFT [dB]')


