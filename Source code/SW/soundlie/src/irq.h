/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __IRQ_H
#define __IRQ_H

/* Includes ------------------------------------------------------------------*/
#include <stdio.h>
#include <stdlib.h>

/* Definitions ---------------------------------------------------------------*/
#define ICLEAR 0x20c
#define IMASK  0x240
#define IFORCE 0x208

/* Function prototypes -------------------------------------------------------*/
void enable_irq(int);
void disable_irq(int);
void force_irq(int);

#endif /* __IRQ_H */
