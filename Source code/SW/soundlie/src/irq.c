#include "irq.h"

int *lreg = (int *) 0x80000000;


void enable_irq (int irq)
{
	lreg[ICLEAR/4] = (1 << irq);	// clear any pending irq
	lreg[IMASK/4] |= (1 << irq);	// unmaks irq
}

void disable_irq (int irq) { lreg[IMASK/4] &= ~(1 << irq); }	// mask irq

void force_irq (int irq) { lreg[IFORCE/4] = (1 << irq); }	// force irq

void irqhandler(int irq)
{
	//Disable IRQ to provide mutual exclusion
	disable_irq(10);

	//Declare/define variables with limited scope
	static echo_data_t echo_data = {
			0x6000,		//Q1.15:0.75
			0x2000,		//Q1.15:0.25
			24000,		//Delay: 0.5sec
			{0}			//Empty buffer
	};

	static circ_buff_t buff_echo_out = {0, {0}};
	static int16_t tmp_out = 0;

	//Write sample from last irq (get 1 sample delay in exchange for "stable skew")
	pwm_write(PWM_APB, tmp_out);

	//Read sample from ADC
	int16_t sample = (int16_t) adc_read(ADC_APB);

	//Run echo
	tmp_out = echo(sample, &buff_echo_out, &echo_data);

	//Enable IR when done
	enable_irq(10);

}
