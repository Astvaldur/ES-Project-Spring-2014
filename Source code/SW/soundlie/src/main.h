/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

/* Includes ------------------------------------------------------------------*/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "datatypes.h"
#include "applications.h"
#include "uart.h"
#include "filters.h"
#include "adc.h"
#include "pwm.h"
#include "irq.h"

/* Definitions ---------------------------------------------------------------*/

void cb_put(int16);
int16 cb_get(int);


/* Function prototypes -------------------------------------------------------*/
extern void *catch_interrupt(void func(), int irq);


extern circ_buff_t cb;


#endif /* __MAIN_H */
