/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __EFFECTS_H
#define __EFFECTS_H

/* Includes ------------------------------------------------------------------*/
#include <stdint.h>
#include <stdbool.h>
#include "datatypes.h"

/* Definitions ---------------------------------------------------------------*/

/* Private function prototypes -----------------------------------------------*/

/* Function prototypes -------------------------------------------------------*/

//int16_t echo(int16_t, echo_data_t *);
bool init_echo_alt();
int16_t echo_alt(int16_t dry_samp);
bool set_echo_alt(echo_input_data *in_data);
int16_t echo(int16_t);
/* Variable declarations -----------------------------------------------------*/

#endif /* __EFFECTS_H */
