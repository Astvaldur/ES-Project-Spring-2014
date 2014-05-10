/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __CHORUS_H
#define __CHORUS_H

/* Includes ------------------------------------------------------------------*/
#include <stdint.h>
#include <stdbool.h>
#include <math.h>
#include "datatypes.h"

/* Definitions ---------------------------------------------------------------*/

/* Function prototypes -------------------------------------------------------*/
bool chorus_init();
int16_t chorus(int16_t);

#endif /* __CHORUS_H */
