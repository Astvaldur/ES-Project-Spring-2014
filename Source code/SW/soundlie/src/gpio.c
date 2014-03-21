/*
 * gpio.c
 *
 *  Created on: 19 feb 2014
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

/*
 * gpio[0] = input data
 * gpio[1] = output data
 * gpio[2] = direction
 * gpio[3] = interrupt...
 */


struct gpio_regs
{
   volatile int input;
   volatile int output;
   volatile int direction;
   volatile int scaler;
};


void gpio_init(int addr)
{
        struct gpio_regs *gpio = (struct gpio_regs *) addr;
              
        gpio->direction = 0xFF;       
        gpio->output = 0xFF;   
}

void gpio_write(int addr, int outdata) {
		struct gpio_regs *gpio = (struct gpio_regs *) addr;
		
		gpio->output = outdata; 
}