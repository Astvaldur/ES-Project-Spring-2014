%%Read audio vectors
%[sine_y,sine_Fs] = audioread('tone24bit.flac');
%[flip_y,flip_Fs] = audioread('Flip.mp3');
[rock_y,rock_Fs] = audioread('Rockin.mp3');

disp('File reads OK!')

%%
filtered_y = rock_y;

coeffs = fir1(10, 1/44100,'low');

for idx = 50001:(numel(rock_y)/3)
    
    tmp = 0;
    
    for n = 1:numel(coeffs)
    
        tmp = tmp + (coeffs(n) * rock_y(idx-n));
    
    end 
    
    filtered_y(idx) = tmp; 
end

disp('Data calculated!')

audiowrite('LP_mono.wav',filtered_y,rock_Fs,'BitsPerSample',24,'Comment','This is my new audio file.');

disp('Output written!')