/**
* @file gpio.c
* @brief Driver for GPIO module on APB.
* @details Driver interface for reading data and writing data from/to GPIO module located on APB-bus.
* @author Tobias Hallberg
* @version 1.0
*/

#include "gpio.h"

/* Struct representation of data registers on APB */
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

/**
 * Initialize GPIO module
 * @param  [in]  addr   Adress of GPIO module on APB bus
 */
void gpio_init(int32_t addr) {
	struct gpio_regs *gpio = (struct gpio_regs *) addr;
	gpio->capability = 0xFFFFFFFF;
	gpio->irq_mask = 0xFFFFF;
	gpio->irq_polarity = 0xFFFFF;
}

/**
 * Read sample from GPIO port
 * @param  [in]  addr   Adress of GPIO module on APB bus
 * @return Current data read from GPIO ports
 */
int32_t gpio_read(int32_t addr){
	struct gpio_regs *gpio = (struct gpio_regs *) addr;
	return gpio->data;
}

/**
 * Write sample to GPIO port
 * @param  [in]  addr   Adress of GPIO module on APB bus
 * @param  [in]  data   Data to be written to GPIO port
 */
void gpio_write(int32_t addr, int32_t data){
	struct gpio_regs *gpio = (struct gpio_regs *) addr;
	gpio->output = data;
}

/**
 * Set pin directions of GPIO port
 * @param  [in]  addr   Adress of GPIO module on APB bus
 * @param  [in]  ports  Direction of pin on GPIO port
 */
void gpio_set_pin_dir(int32_t addr, int32_t ports){
	struct gpio_regs *gpio = (struct gpio_regs *) addr;
	gpio->direction = ports;
}
