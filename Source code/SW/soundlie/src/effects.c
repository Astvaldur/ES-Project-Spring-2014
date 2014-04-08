/**
* @file effects.c
* @brief Sounds effects and associated functions.
* @details Sounds effects and associated functions for use with circular buffer.
* @author Tobias Hallberg
* @version 1.0
*/

#include "effects.h"


int16_t echo(int16_t sample, circ_buff_t *buff_wet, echo_data_t *echo_data) {

	// TODO: use echo_data_t instead
	int16_t coeff_1 = 0x6000;	//Q1.15:0.75
	int16_t coeff_2 = 0x2000;	//Q1.15:0.25
	int16_t delay = 24000;

	// Get delayed wet signal from buffer
	int16_t wet = circ_buff_get(buff_wet, buff_wet->pos - delay);

	// Apply echo effect
	int32_t echo_calc = (sample * coeff_1) + (wet * coeff_2);

	// Perform bitshift to get correct result from Q1.15 x Q1.15 multiplication
	int16_t result = (int16_t) (echo_calc >> 15);

	// Push calculated signal into wet buffer
	circ_buff_put(buff_wet, result);

	return result;
}


