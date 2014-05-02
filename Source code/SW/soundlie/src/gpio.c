/**
* @file gpio.c
* @brief Driver for GPIO module on APB.
* @details Driver interface for reading data and writing data from/to GPIO module located on APB-bus.
* @author Tobias Hallberg
* @version 1.0
*/

#include "gpio.h"

void gpio_set_pin_dir(int32_t, int32_t);

/** Struct representation of data registers on APB */
struct gpio_regs
{
	volatile int32_t data;
	volatile int32_t output;
	volatile int32_t direction;
	volatile int32_t irq_mask;
	volatile int32_t irq_polarity;
	volatile int32_t irq_edge;
	volatile int32_t bypass;
	volatile int32_t capability;
};
/*
0x00 I/O port data register
0x04 I/O port output register
0x08 I/O port direction register
0x0C Interrupt mask register
0x10 Interrupt polarity register
0x14 Interrupt edge register
0x18 Bypass register
0x1C Capability register
0x20 - 0x3C Interrupt map register(s). Address 0x20 + 4*n contains interrupt map
registers for IO[4*n : 3+4+n], if implemented.
*/

void gpio_init(int32_t addr) {

}

int32_t gpio_read(int32_t addr){
	struct gpio_regs *gpio = (struct gpio_regs *) addr;
	return gpio->data;
}

void gpio_write(int32_t addr, int32_t data){
	struct gpio_regs *gpio = (struct gpio_regs *) addr;
	gpio->output = data;
}

void gpio_set_pin_dir(int32_t addr, int32_t ports){
	struct gpio_regs *gpio = (struct gpio_regs *) addr;
	gpio->direction = ports;
}
