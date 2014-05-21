/**
 * @file echo.h
 * @brief header file for echo.h.
 * @details Header file for sound effects and associated functions for use with circular buffer.
 * @author Tobias Hallberg
 * @author Jonas Andersson
 * @version 1.0
 */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __ECHO_H
#define __ECHO_H

/* Includes ------------------------------------------------------------------*/
#include <stdint.h>
#include <stdbool.h>
#include <math.h>
#include "datatypes.h"

/* Definitions ---------------------------------------------------------------*/
#define ECHO_DEL_LO_LIM		480
#define ECHO_DEL_HI_LIM		48000
#define ECHO_DEL_STEP 		4800
#define ECHO_AMP_STEP 		0x500
#define ECHO_TOT_POW		0x8000

/* Function prototypes -------------------------------------------------------*/
bool echo_init();
int16_t echo(int16_t);
bool echo_set(echo_input_data_t *);
echo_input_data_t echo_get(void);

#endif /* __ECHO_H */
