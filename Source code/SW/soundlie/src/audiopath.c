/**
 * @file audiopath.c
 * @brief Audiopath....
 * @details .
 * @author Tobias Hallberg
 * @version 1.0
 */

#include "audiopath.h"

/**
 * Receive and handle IRQ from ADC
 * @param  [in]  irq	Source of the generated interrupt
 * @return None
 */
void sample_irq(int32_t irq)
{
	//Disable IRQ to provide mutual exclusion
	disable_irq(SAMPLE_IRQ_ID);

	static circ_buff_t circ_buff;
	static int16_t tmp_out = 0;

	//Write sample from last irq (get 1 sample delay in exchange for "stable skew")
	pwm_write(PWM_APB, tmp_out);

	//Read sample from ADC
	int16_t sample = (int16_t) adc_read(ADC_APB);

	circ_buff_put(&circ_buff, sample);

	//Run straight through
	tmp_out = circ_buff_get(&circ_buff, 0);

	//Run echo
	//tmp_out = echo(sample);

	//Run tone control
	//tmp_out = tc_amp(&(echo_data.buff_wet));
	//tmp_out = tc_amp(&circ_buff);

	//Enable IRQ when done
	enable_irq(SAMPLE_IRQ_ID);

}


