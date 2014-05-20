Fs = 48000;
F = 1000;
duration = 60;

for i=1:Fs*duration
    if mod(i, 25000) < 1200
        Y(i) = 1; 
    else 
        Y(i) = -1;
    end
end


%plot(Y)

audiowrite('square.wav',Y,48000);