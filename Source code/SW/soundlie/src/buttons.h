/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __BUTTONS_H
#define __BUTTONS_H

/* Includes ------------------------------------------------------------------*/
#include <stdint.h>
#include "gpio.h"
#include "datatypes.h"
#include "tone_control.h"
#include "irq.h"

/* Definitions ---------------------------------------------------------------*/

#define BUTN_L 	0
#define BUTN_R 	1
#define BUTN_U 	2
#define BUTN_D 	3
#define BUTN_C 	4

#define LED_R 	5
#define LED_G 	6
#define LED_B 	7

#define SW_0  	8
#define SW_1  	9
#define SW_2  	10
#define SW_3  	11
#define SW_4  	12
#define SW_5 	13
#define SW_6  	14
#define SW_7 	15
#define SW_8  	16
#define SW_9  	17
#define SW_10 	18
#define SW_11  	19
#define SW_12  	20
#define SW_13  	21
#define SW_14  	22
#define SW_15  	23

/* Function prototypes -------------------------------------------------------*/
void buttons_irq(int32_t);
void buttons_init(void);

#endif /* __BUTTONS_H */
