function hFig = plotSpectrogram(varargin)
%PLOTSPECTROGRAM plots spectrogram (on a logarithmic frequency axis)
%
% Description:
%   Plots the spectrogram of a signal
%
% Syntax:
%   h = plotSpectrogram(audioFileName)
%   plotSpectrogram(input,fs)
%   plotSpectrogram(___,window,nOverlap_sec,nFreqs)
%
% Inputs:
%   audioFileName - a string specifying the path and file name of the file
%   input - the signal
%   fs - the sampling rate (in Hz)
% 
% Outputs:
%   h - figure handle
%
% Optional Inputs:
%   window - uses the vector `window` to split the signal into frames
%            Alternatively, `window` can be a cell array of a window name
%            and length in seconds (e.g., {'blackman',0.050})
%            (defaults to a 10ms Hamming window)
%   nOverlap_sec - uses `nOverlap` seconds of overlap between adjacent
%             frames
%            (defaults to 50% of the window length)
%   nFreqs - uses `nFreqs` logarithmically spaced frequencies per frame
%            (defaults to 128)
%
% Example:
%   % Plot the spectrogram of a swept tone
%   >> Fs = 48000;
%   >> t = linspace(0,1,Fs); % 1sec
%   >> fo = 100; % start at 100Hz
%   >> f1 = 10e3; % end at 10kHz
%   >> x = chirp(t,fo,max(t),f1,'logarithmic');
%   >> plotSpectrogram(x,Fs);

%   See also GETSPECTROGRAM.

% written by Jon Boley

[freqs,times,psd] = getSpectrogram(varargin{:});

hFig = figure;
surf(times,freqs,psd,'EdgeColor','none');
set(gca,'YDir','normal');
axis tight
view(0,90);
set(gca,'YScale','log','Ytick',[100 1e3 10e3],'YTickLabel',{'100Hz','1kHz','10kHz'});
xlabel('Time (sec)');
ylabel('Frequency (Hz)');
h = colorbar;
h.Label.String = 'Power/frequency (dB/Hz)';
