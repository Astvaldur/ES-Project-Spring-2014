/**
 * @file main.h
 * @brief Header file for main.c
 * @details Header file for main program.
 * @author Viktor Jarenfors
 * @author Tobias Hallberg
 * @author Jonas Andersson
 * @author David Alm
 * @version 1.0
 */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

/* Includes ------------------------------------------------------------------*/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>

#include "datatypes.h"
#include "uart.h"
#include "adc.h"
#include "buttons.h"
#include "pwm.h"
#include "irq.h"
#include "echo.h"
#include "audiopath.h"
#include "pc_communication.h"

/* Function prototypes -------------------------------------------------------*/
extern void *catch_interrupt(void func(), int irq);

#endif /* __MAIN_H */
