/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __SOUNDPATH_H
#define __SOUNDPATH_H

/* Includes ------------------------------------------------------------------*/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "datatypes.h"
#include "main.h"

/* Definitions ---------------------------------------------------------------*/
#define SAMPLE_IRQ_ID	10

/* Function prototypes -------------------------------------------------------*/
void sample_irq(int32_t);

#endif /* __SOUNDPATH_H */
