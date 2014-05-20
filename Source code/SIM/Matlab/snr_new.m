clear all;
close all;
clc;

[y,FS]=audioread('result_1khz_tc_0db.wav');


L = length(y);                 	% Length of signal
t = (0:L-1)*(1/FS);            	% Time vector
% Sum of a 50 Hz sinusoid and a 120 Hz sinusoid
%figure(1)
%subplot(3,1,1)
%plot(FS*t(1:50),y(1:50))
%title('1000 Signal Corrupted with Zero-Mean Random Noise')
%xlabel('time (milliseconds)')

NFFT = 2^nextpow2(L); % Next power of 2 from length of y
Y = fft(y,NFFT)/L;
%f = (FS/2)*linspace(0,1,NFFT/2+1);
f=FS/NFFT.*(0:(NFFT/2)-1);
% Plot single-sided amplitude spectrum.

%Fc = 1000;
%duration = 50;
%i=0:1/Fc:1-1/Fc;
%Yi= sin((2*pi/(Fs/F))*i);
sinesnr= snr(y(:,1),FS,6);
disp('snr for 1kHz');
disp(sinesnr)
%plot(f,2*abs(Y(1:NFFT/2)))
%title('1000 Single-Sided Amplitude Spectrum of y(t)')
%xlabel('Frequency (Hz)')
%ylabel('|Y(f)|')
figure(2)
plot(f,20*log10(2*abs(Y(1:NFFT/2))))
title('Single-Sided decibell megnitude of y(t)')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')
ylim([-100 0])


