/**
* @file adc.h
* @brief Header file for adc.c
* @details Herader file for driver interface for reading data from XADC module located on APB-bus.
* @author Tobias Hallberg
* @version 1.0
*/

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __ADC_H
#define __ADC_H

/* Includes ------------------------------------------------------------------*/
#include <stdint.h>

/* Definitions ---------------------------------------------------------------*/
#define ADC_APB  0x80000A00

/* Function prototypes -------------------------------------------------------*/
int32_t adc_read(int32_t);

#endif /* __ADC_H */
