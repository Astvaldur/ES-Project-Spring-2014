%%Read audio vectors
%[sine_y,sine_Fs] = audioread('tone24bit.flac');
%[flip_y,flip_Fs] = audioread('Flip.mp3');
[rock_y,rock_Fs] = audioread('Rockin.mp3');

disp('File reads OK!')

%%
%filtered_y = rock_y;
filtered_y = [];

for idx = 1:(numel(rock_y))
    filtered_y(idx) = 0;
end

%coeffs = fir1(20, 1/44100,'high');
[x, y] = butter(2, 0.3/48, 'low');

for idx = 125000:(numel(rock_y)/3)

    tmp = 0;
    
    for n = 1:numel(x)
    
        tmp = tmp + (x(n) * rock_y(idx-n + 1));
    
    end 
    
    for n = 2:numel(y)
    
        tmp = tmp - (y(n) * filtered_y(idx-n + 1));
    
    end 
    
    tmp;
    
    filtered_y(idx) = tmp;
end

disp('Data calculated!')

audiowrite('LP_mono.wav',filtered_y,rock_Fs,'BitsPerSample',24,'Comment','This is my new audio file.');

disp('Output written!')