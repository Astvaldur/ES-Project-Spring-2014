/*
 * pwm.c
 *
 *  Created on: 28 feb 2014
 *      Author:
 */

//#include <stdio.h>

#define DISABLE 0x0
#define ENABLE_RX 0x1
#define ENABLE_TX 0x2
#define RX_INT 0x4
#define TX_INT 0x8
#define EVEN_PARITY 0x20
#define ODD_PARITY 0x30
#define LOOP_BACK 0x80
#define FLOW_CONTROL 0x40
#define FIFO_TX_INT 0x200
#define FIFO_RX_INT 0x400



struct adc_regs
{
   volatile int sample;
   //volatile int output;
   //volatile int direction;
   //volatile int scaler;
};


void adc_init(int addr)
{
        //struct pwm_regs *pwm = (struct pwm_regs *) addr;

        //pwm->direction = 0xFF;
        //pwm->output = 0xFF;
}

int adc_read(int addr) {
		struct adc_regs *pwm = (struct adc_regs *) addr;

		return pwm->sample;
}
