/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef DATATYPES_H_
#define DATATYPES_H_

/* Includes ------------------------------------------------------------------*/
#include <stdint.h>

/* Definitions ---------------------------------------------------------------*/
//#define CIRC_BUFF_SIZE		48000
#define CIRC_BUFF_SIZE		48000
#define IIR_MAX_COEFFS  	15

typedef enum {FILTER_LP, FILTER_MID, FILTER_HP, SET_BASS, SET_MIDDLE, SET_TREBLE} input_type_e;

typedef struct {
	int32_t		pos;					/* Position of latest added val	 */
	int16_t		elems[CIRC_BUFF_SIZE];  /* Vector of elements            */
} circ_buff_t;

typedef struct {
	uint16_t	num_coeffs;				  /* Current number of coefficients */
	int16_t		coeffs_x[IIR_MAX_COEFFS]; /* Array of X coefficients		*/
	int16_t		coeffs_y[IIR_MAX_COEFFS]; /* Array of Y coefficients		*/
	circ_buff_t buff_wet;				  /* Buffer for wet signal 		 	*/
} iir_data_t;

typedef struct {
	uint16_t delay;						/* Delay in number of samples	 */
	int16_t dry_amp;					/* Attenuation of dry signal	 */
	int16_t wet_amp;					/* Attenuation of wet signal	 */
	circ_buff_t buff_wet;				/* Buffer for wet signal 		 */
} echo_data_t;

typedef struct {
	int16_t lp_amp;						/* Attenuation of LP signal	 	 */
	int16_t bp_amp;						/* Attenuation of BP signal	 	 */
	int16_t hp_amp;						/* Attenuation of HP signal	 	 */
} tc_ctrl_data_t;

typedef struct {
	uint8_t taps;						/* Add member comments here!	*/
	input_type_e type;					/* Add member comments here!	*/
	int16_t *x_data;					/* Add member comments here!	*/
	int16_t *y_data;					/* Add member comments here!	*/
}iir_input_data_t;

typedef struct {
	uint16_t delay;						/* Delay in number of samples	 */
	int16_t dry_amp;					/* Attenuation of dry signal	 */
	int16_t wet_amp;					/* Attenuation of wet signal	 */
} echo_input_data_t;


/* Function prototypes -------------------------------------------------------*/
void circ_buff_put(circ_buff_t *, int16_t);
int16_t circ_buff_get(circ_buff_t *, int32_t);

#endif /* DATATYPES_H_ */
