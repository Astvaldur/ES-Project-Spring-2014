/**
* @file adc.c
* @brief Driver for ADC on APB.
* @details Driver interface for reading data from XADC module located on APB-bus.
* @author Tobias Hallberg
* @version 1.0
*/

#include "adc.h"

/** Struct representation of data registers on APB */
struct adc_regs
{
   volatile int32_t sample;
};

/**
 * Read sample from ADC
 * @param  [in]  addr   Adress of custom ADC on APB bus
 * @return 32 bit sample from ADC where significant data is between bit 15 down to 2
 */
int32_t adc_read(int32_t addr) {
		struct adc_regs *pwm = (struct adc_regs *) addr;

		return pwm->sample;
}
