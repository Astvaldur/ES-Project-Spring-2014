/**
 * @file buttons.h
 * @brief Header file for buttons.c
 * @details Header file for driver interface for reading data from XADC module located on APB-bus.
 * @author Tobias Hallberg
 * @version 1.0
 */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __BUTTONS_H
#define __BUTTONS_H

/* Includes ------------------------------------------------------------------*/
#include <stdint.h>
#include <stdbool.h>
#include "gpio.h"
#include "datatypes.h"
#include "audiopath.h"
#include "echo.h"
#include "tone_control.h"
#include "irq.h"

/* Definitions ---------------------------------------------------------------*/
#define ACT_BUTN		0x3FF00

#define BUTN_L 	0
#define BUTN_R 	1
#define BUTN_U 	2
#define BUTN_D 	3
#define BUTN_C 	4

#define LED_R 	5
#define LED_G 	6
#define LED_B 	7

#define SW_TC_EN  	8
#define SW_TC_BAS  	9
#define SW_TC_MID  	10
#define SW_TC_TRE  	11
#define SW_ECHO_EN 	12
#define SW_ECHO_DEL	13
#define SW_ECHO_AMP	14
#define SW_CHO_EN 	15
#define SW_CHO_DEL 	16
#define SW_CHO_AMP 	17

#define THREE_DB	1.41

/* Function prototypes -------------------------------------------------------*/
void buttons_irq(int32_t);
void buttons_poll(void);

#endif /* __BUTTONS_H */
