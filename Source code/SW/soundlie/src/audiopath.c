/**
 * @file audiopath.c
 * @brief Audiopath....
 * @details .
 * @author Tobias Hallberg
 * @version 1.0
 */

#include "audiopath.h"

static audiopath_t audiopath_state;

/**
 * Initialize the the audio path and enables the proper interrupts
 * @param  None
 * @return None
 */
void audiopath_init() {
	catch_interrupt(sample_irq, SAMPLE_IRQ_ID);
	enable_irq(SAMPLE_IRQ_ID);

	audiopath_state.effects_enable = OFF;
	audiopath_state.tc_enable = true;
}

/**
 * Set...
 * @param  None
 * @return None
 */
void audiopath_set(audiopath_t *audiopath_new_state) {
	audiopath_state.effects_enable = audiopath_new_state->effects_enable;
	audiopath_state.tc_enable = audiopath_new_state->tc_enable;
}

/**
 * Get...
 * @param  None
 * @return None
 */
audiopath_t audiopath_get() {
	return audiopath_state;
}

/**
 * Receive and handle IRQ from ADC
 * @param  [in]  irq	Source of the generated interrupt
 * @return None
 */
void sample_irq(int32_t irq)
{
	/* Disable IRQ to provide mutual exclusion */
	disable_irq(SAMPLE_IRQ_ID);

	static circ_buff_t circ_buff;
	static int16_t sample = 0;

	/* Write sample from last irq (get 1 sample delay in exchange for "stable skew") */
	pwm_write(PWM_APB, sample);

	/* Read sample from ADC */
	sample = (int16_t) adc_read(ADC_APB);

	switch (audiopath_state.effects_enable) {
	case ECHO :
		/* Run echo */
		sample = echo(sample);
		break;
	case CHORUS :
		/* Run chorus */
		sample = chorus(sample);
		break;
	case OFF :
		/* Do nothing */
		break;
	}

	/* Add sample to buffer */
	circ_buff_put(&circ_buff, sample);

	//sample = circ_buff_get(&circ_buff, 0);

	if (audiopath_state.tc_enable) {
		/* Run tone control */
		sample = tc_amp(&circ_buff);
	}

	/* Enable IRQ when done */
	enable_irq(SAMPLE_IRQ_ID);
}
