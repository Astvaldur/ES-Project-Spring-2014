/**
* @file effects.c
* @brief Sounds effects and associated functions.
* @details Sounds effects and associated functions for use with circular buffer.
* @author Tobias Hallberg
* @version 1.0
*/

#include "effects.h"

int16_t echo(int16_t sample) {
	int16_t delay = 500;

	static circ_buff_t buff_dry;
	static circ_buff_t buff_wet;

	circ_buff_put(&buff_dry, sample);

	int16_t wet = circ_buff_get(&buff_wet, buff_wet.pos - delay);

	int16_t result = (sample * 0.8) + (wet * 0.4);
	//add correct mult and bitshift

	circ_buff_put(&buff_wet, result);

	return result;

}


