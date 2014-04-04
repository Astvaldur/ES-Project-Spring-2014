#include "irq.h"

static int irq_counter;
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
	disable_irq(10);

	static int tmp_out = 0;

	static circ_buff_t circ_buff;

	if (irq_counter < 16) {
		//puts("I");

		//pwm_write(PWM_APB, adc_read(ADC_APB)); // Straight through
		pwm_write(PWM_APB, tmp_out);

		circ_buff_put(&circ_buff, adc_read(ADC_APB));

		//tmp_out = circ_buff_get(&circ_buff, circ_buff.pos); // Straight through buffer and decimate
		//tmp_out = tc_fir(tc_lp, &circ_buff); //Use LP-filter
		//tmp_out = tc_fir(tc_hp, &circ_buff); //Use HP-filter

		tmp_out = tc_amp(&circ_buff);


		irq_counter = 0;

	}
	irq_counter++;

	enable_irq(10);

}
