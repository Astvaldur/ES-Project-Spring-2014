-- 
config wave -signalnamewidth 1
restart -f -nowave

view signals wave
#add wave /*
add wave -color brown tb_clk
add wave -color blue tb_reset
add wave -color yellow -unsigned tb_vsample
add wave -color "light yellow" -unsigned tb_sample_nr
add wave -color "light blue"  -unsigned tb_index
add wave -color violet -unsigned tb_pwm_change
add wave -color "light green" tb_pwm_signal
add wave -color green tb_pwm
run 150000000 ns
