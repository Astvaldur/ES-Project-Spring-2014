soundlie_final.bit:
	Leon core with: 
	ADC
		APB: 80000A00 - 80000B00
		IRQ: 10
	DAC module
		APB: 80000B00 - 80000C00
		IRQ: 11
	uart0     Aeroflex Gaisler  Generic UART
        APB: 80000100 - 80000200
        IRQ: 2
		
		Pin connection:
		JB(0) - RX
		JB(1) - TX
		
	gpio0     Aeroflex Gaisler  General Purpose I/O port (mapped to buttons and rgb led)
          APB: 80000C00 - 80000D00

	Eth debug ip: 129.16.23.17
    Mac address : 20:00:00:00:00:11
	
soundlie_final.bin:
	Final embedded software for Soundlie
