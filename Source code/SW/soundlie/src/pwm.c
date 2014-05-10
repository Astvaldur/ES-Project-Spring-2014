/**
* @file adc.c
* @brief Driver for PWM on APB.
* @details Driver interface for writing data to PWM module located on APB-bus.
* @author Tobias Hallberg
* @version 1.0
*/

#include "pwm.h"

/* Struct representation of data registers on APB */
struct pwm_regs
{
   volatile int output;
};

/**
 * Write new sample to DAC output
 * @param  [in]  addr		Address of PWM module on APB
 * @param  [in]  sample		Sample to be written to DAC output
 * @return None
 */
void pwm_write(int32_t addr, int32_t sample) {
		struct pwm_regs *pwm = (struct pwm_regs *) addr;

		pwm->output = sample;
}
