function y = windowFFT(u,fs,fcut)

L = length(u);
idx_cut = fcut/fs;
idx_start = floor(L*idx_cut);
idx_end = floor(L*(1-idx_cut));

F = fft(u);
y = F;
y(idx_start:idx_end) = 0;