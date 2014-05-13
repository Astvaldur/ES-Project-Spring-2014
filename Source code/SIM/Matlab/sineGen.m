Fs = 48000;
F = 1000;
duration = 1500;

for i=1:duration*Fs
   Y(i) = sin((2*pi/(Fs/F))*i); 
end

%plot(Y)

audiowrite('sig.wav',Y,48000);