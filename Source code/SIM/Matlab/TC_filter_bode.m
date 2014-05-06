clear all;
close all;
clc;

lp_order = 2;
bp_order = 3;
hp_order = 2;

cutoff_low = 300;
cutoff_high = 2400;
Fs = 48000;


[X_lp, Y_lp] = butter(lp_order, cutoff_low/Fs, 'low');
[X_bp, Y_bp] = butter(bp_order, [cutoff_low/Fs cutoff_high/Fs], 'bandpass');
[X_hp, Y_hp] = butter(hp_order, cutoff_high/Fs, 'high');

sys_lp = tf(X_lp, Y_lp, 1/Fs);
sys_bp = tf(X_bp, Y_bp, 1/Fs);
sys_hp = tf(X_hp, Y_hp, 1/Fs);


hold on
bode(sys_lp);
bode(sys_bp);
bode(sys_hp);
