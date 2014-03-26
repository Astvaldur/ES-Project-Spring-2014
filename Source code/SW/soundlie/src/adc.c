/**
* @file adc.c
* @brief Driver for ADC on APB.
* @details Driver interface for reading data from XADC module located on APB-bus.
* @author Tobias Hallberg
* @version 1.0
*/

struct adc_regs
{
   volatile int sample;
   //Add more members here
};

int adc_read(int addr) {
		struct adc_regs *pwm = (struct adc_regs *) addr;

		return pwm->sample;
}
