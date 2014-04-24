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
			24000,		//Delay: 0.5sec
			0x6000,		//Q1.15:0.75
			0x2000,		//Q1.15:0.25
			{0}			//Empty buffer
	};

	static circ_buff_t circ_buff;

	static int16_t tmp_out = 0;

	//Write sample from last irq (get 1 sample delay in exchange for "stable skew")
	pwm_write(PWM_APB, tmp_out);



	//Read sample from ADC
	int16_t sample = (int16_t) adc_read(ADC_APB);

	circ_buff_put(&circ_buff, sample);

	//Run straight through
	//tmp_out = circ_buff_get(&circ_buff, circ_buff.pos);

	//Run echo
	//tmp_out = echo(sample, &echo_data);

	//Run echo alternative
	tmp_out = echo_alt(sample);


	//Run tone control
	//tmp_out = tc_amp(&(echo_data.buff_wet));
	//tmp_out = tc_amp(&circ_buff);



	//Enable IRQ when done
	enable_irq(10);

}
