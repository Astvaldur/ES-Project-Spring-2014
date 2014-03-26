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

	if (irq_counter < 16) {

		int adc_sample = adc_read(ADC_APB);

		int outdata = 0.6* adc_sample + (0.3 * cb_get(cb.pos-10000));
		//int outdata = adc_sample;

		cb_put(outdata);

		pwm_write(PWM_APB, outdata);

		//pwm_write(PWM_APB, adc_sample);
	irq_counter = 0;

	}
	irq_counter++;

	enable_irq(10);


	//Return value is of int16 type
	/*Test_filter_output_Lowpass = iir_LP( Test_filter_input);
	Test_filter_output_BandPass = iir_BP( Test_filter_input);
	Test_filter_output_Highpass = iir_HP( Test_filter_input);*/

	//Send the output
	//printf("%hu \n",Test_filter_output_Lowpass);
	//printf("%hu \n",Test_filter_output_BandPass);
	//printf("%hu \n",Test_filter_output_Highpass);

	//apbuart_Send(Test_filter_output_Lowpass);
	//apbuart_Send(Test_filter_output_BandPass);
    //apbuart_Send(Test_filter_output_Highpass);

}
