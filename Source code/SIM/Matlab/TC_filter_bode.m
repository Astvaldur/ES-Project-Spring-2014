clear all;
close all;
clc;

lp_order = 2;
bp_order = 2;
hp_order = 2;

LP_cutoff = 300;

BP_cutoff_low = 300;
BP_cutoff_hi = 2400;

HP_cutoff = 2400;
Fs = 48000;


[X_lp, Y_lp] = butter(lp_order, LP_cutoff/Fs, 'low');
[X_bp, Y_bp] = butter(bp_order, [BP_cutoff_low/Fs BP_cutoff_hi/Fs], 'bandpass');
[X_hp, Y_hp] = butter(hp_order, HP_cutoff/Fs, 'high');

sys_lp = tf(X_lp, Y_lp, 1/Fs);
sys_bp = tf(X_bp, Y_bp, 1/Fs);
sys_hp = tf(X_hp, Y_hp, 1/Fs);

%bodeplot(sys_lp, sys_bp, Fs);

hold on
bode(sys_lp);
bode(sys_bp);
bode(sys_hp);
