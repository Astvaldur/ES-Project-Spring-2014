-- ALU_do
config wave -signalnamewidth 1
restart -f -nowave

view signals wave
#add wave /*
add wave -color brown tb_clk
add wave -color blue tb_reset
add wave -color yellow tb_vsample
add wave -color brown tb_pwm
run 150000000 ns
