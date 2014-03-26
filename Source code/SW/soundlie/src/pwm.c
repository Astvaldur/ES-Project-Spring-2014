/**
* @file adc.c
* @brief Driver for PWM on APB.
* @details Driver interface for writing data to PWM module located on APB-bus.
* @author Tobias Hallberg
* @version 1.0
*/

#include "pwm.h"

struct pwm_regs
{
   volatile int output;
};

void pwm_init(int addr)
{
        //struct pwm_regs *pwm = (struct pwm_regs *) addr;

        //pwm->direction = 0xFF;
        //pwm->output = 0xFF;
}

void pwm_write(int addr, int outdata) {
		struct pwm_regs *pwm = (struct pwm_regs *) addr;

		pwm->output = outdata;
}
