/**
* @file effects.c
* @brief Sounds effects and associated functions.
* @details Sounds effects and associated functions for use with circular buffer.
* @author Tobias Hallberg
* @version 1.0
*/

#include "effects.h"


int16_t echo(int16_t dry_samp, echo_data_t *echo_data) {

	// Get delayed wet signal from buffer
	int16_t wet_samp = circ_buff_get(&(echo_data->buff_wet), echo_data->buff_wet.pos - echo_data->delay);

	// Apply echo effect
	int32_t echo_calc = (dry_samp * echo_data->dry_amp) + (wet_samp * echo_data->wet_amp);

	// Perform bitshift to get correct result from Q1.15 x Q1.15 multiplication
	int16_t result = (int16_t) (echo_calc >> 15);

	// Push calculated signal into wet buffer
	circ_buff_put(&(echo_data->buff_wet), result);

	return result;
}


