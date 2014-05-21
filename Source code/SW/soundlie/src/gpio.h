/**
* @file gpio.h
* @brief header file for gpio.c
* @details Header file for driver interface used for reading data and writing data from/to GPIO module located on APB-bus.
* @author Tobias Hallberg
* @version 1.0
*/

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __GPIO_H
#define __GPIO_H

/* Includes ------------------------------------------------------------------*/
#include <stdint.h>

/* Definitions ---------------------------------------------------------------*/
#define GPIO_APB  0x80000C00

/* Function prototypes -------------------------------------------------------*/
void gpio_init(int32_t);
void gpio_write(int32_t, int32_t);
void gpio_set_pin_dir(int32_t, int32_t);
int32_t gpio_read(int32_t);

#endif /* __ADC_H */
