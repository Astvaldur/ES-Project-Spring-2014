-- ALU_do
config wave -signalnamewidth 1
restart -f -nowave

view signals wave
#add wave /*
add wave -color brown clk
add wave -color blue reset
add wave -color brown A
add wave -color brown B
add wave -color blue result
add wave -binary -color yellow opcode

run 150000 ns
