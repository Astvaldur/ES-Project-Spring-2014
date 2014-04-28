/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __TONE_CONTROL_H
#define __TONE_CONTROL_H

/* Includes ------------------------------------------------------------------*/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>

#include "datatypes.h"
#include "adc.h"

/* Definitions ---------------------------------------------------------------*/

/* Function prototypes -------------------------------------------------------*/
int16_t tc_amp(circ_buff_t *);
bool tc_set_filter_coeff(iir_input_data_t *in_data);

/* Variables -----------------------------------------------------------------*/


#endif /* __TONE_CONTROL_H */
