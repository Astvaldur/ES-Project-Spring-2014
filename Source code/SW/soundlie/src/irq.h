/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __IRQ_H
#define __IRQ_H

/* Includes ------------------------------------------------------------------*/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>

#include "applications.h"
#include "uart.h"
#include "adc.h"
#include "pwm.h"
#include "tone_control.h"

/* Definitions ---------------------------------------------------------------*/
#define ICLEAR 0x20c
#define IMASK  0x240
#define IFORCE 0x208

/* Private function prototypes -----------------------------------------------*/

/* Function prototypes -------------------------------------------------------*/
void enable_irq(int);
void disable_irq(int);
void force_irq(int);
void irqhandler(int);



#endif /* __IRQ_H */
