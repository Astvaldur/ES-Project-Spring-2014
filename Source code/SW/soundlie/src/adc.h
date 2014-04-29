/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __ADC_H
#define __ADC_H

/* Includes ------------------------------------------------------------------*/
#include <stdint.h>

/* Definitions ---------------------------------------------------------------*/
#define ADC_APB  0x80000A00

/* Private function prototypes -----------------------------------------------*/

/* Function prototypes -------------------------------------------------------*/
int32_t adc_read(int32_t);

#endif /* __ADC_H */
