/**
 * @file tone_control.h
 * @brief Header file for tone_control.c.
 * @details Header file for tone control feature.
 * @author Tobias Hallberg
 * @author Jonas Andersson
 * @version 1.0
 */

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

/* Function prototypes -------------------------------------------------------*/
void tc_init(void);
int16_t tc_amp(circ_buff_t *);
void tc_set_amp(tc_ctrl_data_t *);
tc_ctrl_data_t tc_get_amp(void);
bool tc_amp_valid_value(int16_t);
bool tc_set_filter_coeff(iir_input_data_t *);

#endif /* __TONE_CONTROL_H */
