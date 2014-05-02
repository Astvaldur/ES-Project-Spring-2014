/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

/* Includes ------------------------------------------------------------------*/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>

#include "datatypes.h"
#include "applications.h"
#include "uart.h"
#include "adc.h"
#include "pwm.h"
#include "pwm.h"
//#include "gpio.h"
#include "irq.h"
#include "effects.h"
#include "audiopath.h"
#include "pc_communication.h"



/* Definitions ---------------------------------------------------------------*/


/* Function prototypes -------------------------------------------------------*/
extern void *catch_interrupt(void func(), int irq);

/* Global variables ----------------------------------------------------------*/


#endif /* __MAIN_H */
