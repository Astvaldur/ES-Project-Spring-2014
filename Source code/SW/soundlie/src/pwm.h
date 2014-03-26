/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __PWM_H
#define __PWM_H

/* Includes ------------------------------------------------------------------*/

/* Definitions ---------------------------------------------------------------*/
#define PWM_APB  0x80000B00

/* Private function prototypes -----------------------------------------------*/


/* Function prototypes -------------------------------------------------------*/
void pwm_init(int);
void pwm_write(int, int);

#endif /* __PWM_H */
