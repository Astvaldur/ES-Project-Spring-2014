/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef DATATYPES_H_
#define DATATYPES_H_

/* Includes ------------------------------------------------------------------*/
#include <stdint.h>

/* Definitions ---------------------------------------------------------------*/
#define CIRC_BUFF_SIZE	48000
#define FIR_MAX_COEFFS	100

typedef int int16;
typedef int int32;

typedef struct {
    int32_t			pos;					/* Position of latest added val	 */
    int16_t			elems[CIRC_BUFF_SIZE];  /* Vector of elements            */
} circ_buff_t;

typedef struct {
	uint16_t	num_coeffs;					/* Current number of coefficients*/
	int16_t		coeffs[FIR_MAX_COEFFS];		/* Array of coefficients		 */

} fir_data_t;

/* Function prototypes -------------------------------------------------------*/
void circ_buff_put(circ_buff_t *, int16_t);
int16_t circ_buff_get(circ_buff_t *, int32_t);

#endif /* DATATYPES_H_ */
