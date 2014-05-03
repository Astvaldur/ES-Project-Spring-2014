/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __EFFECTS_H
#define __EFFECTS_H

/* Includes ------------------------------------------------------------------*/
#include <stdint.h>
#include <stdbool.h>
#include "datatypes.h"

/* Definitions ---------------------------------------------------------------*/

/* Function prototypes -------------------------------------------------------*/
bool echo_init();
int16_t echo(int16_t);
bool set_echo_alt(echo_input_data_t *);

#endif /* __EFFECTS_H */
