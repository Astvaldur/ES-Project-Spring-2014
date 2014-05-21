/**
* @file pwm.h
* @brief Header file for pwm.c
* @details Header file for driver interface used for writing data to PWM module located on APB-bus.
* @author Tobias Hallberg
* @version 1.0
*/

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __PWM_H
#define __PWM_H

/* Includes ------------------------------------------------------------------*/
#include <stdint.h>

/* Definitions ---------------------------------------------------------------*/
#define PWM_APB  0x80000B00

/* Function prototypes -------------------------------------------------------*/
void pwm_init(int);
void pwm_write(int32_t, int32_t);

#endif /* __PWM_H */
