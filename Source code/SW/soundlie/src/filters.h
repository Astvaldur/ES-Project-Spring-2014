/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef FILTERS_H_
#define FILTERS_H_

//Move to better location!
//typedef int int16;
//typedef int int32;


/* Includes ------------------------------------------------------------------*/
#include "main.h"

/* Private function prototypes -----------------------------------------------*/

/* Function prototypes -------------------------------------------------------*/
int16 iir_LP(int16 NewSample);
int16 iir_BP(int16 NewSample);
int16 iir_HP(int16 NewSample);

/* Private variables ---------------------------------------------------------*/


#endif /* FILTERS_H_ */
