/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __SOUNDPATH_H
#define __SOUNDPATH_H

/* Includes ------------------------------------------------------------------*/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>

#include "datatypes.h"
#include "main.h"
#include "adc.h"

/* Definitions ---------------------------------------------------------------*/
#define SAMPLE_IRQ_ID	10

typedef enum {OFF, ECHO, CHORUS} effects_enable_e;

typedef struct {
	bool				tc_enable;
	effects_enable_e	effects_enable;
} audiopath_t;

/* Function prototypes -------------------------------------------------------*/
void audiopath_init(void);
void audiopath_set(audiopath_t *);
audiopath_t audiopath_get(void);
void sample_irq(int32_t);

#endif /* __SOUNDPATH_H */
