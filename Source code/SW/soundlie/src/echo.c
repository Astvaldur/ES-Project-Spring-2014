/**
 * @file echo.c
 * @brief Sound effect echo and associated functions.
 * @details Sound effects and associated functions for use with circular buffer.
 * @author Tobias Hallberg
 * @author Jonas Andersson
 * @version 1.0
 */

#include "echo.h"

/* Declare variables with limited scope */
static echo_data_t echo_data;

/**
 * Used for applying the echo sound effect to the incoming signal
 * @param  [in]  dry_sample   Latest sample of input signal
 * @return Output signal from echo.
 */
int16_t echo(int16_t dry_samp) {

	/* Get delayed wet signal from buffer */
	int16_t wet_samp = circ_buff_get(&(echo_data.buff_wet), echo_data.delay);

	/* Apply echo effect */
	int32_t echo_calc = (dry_samp * echo_data.dry_amp) + (wet_samp * echo_data.wet_amp);

	/* Perform bitshift to get correct result from Q1.15 x Q1.15 multiplication */
	int16_t result = (int16_t) (echo_calc >> 15);

	/* Push calculated signal into wet buffer */
	circ_buff_put(&(echo_data.buff_wet), result);

	return result;
}

/**
 * Initialize the echo sound effect and set the default settings
 * @return Returns true
 */
bool echo_init()
{
	echo_data.delay = 24000;
	echo_data.dry_amp = 0x4000;
	echo_data.wet_amp = 0x4000;

	return true;
}

/**
 * Sets the parameters for the echo sound effect
 * @param  [in] in_data Data structure containing the parameter values to be set
 * @return Returns true
 */
bool echo_set(echo_input_data_t *in_data){
	if (ECHO_DEL_LO_LIM < in_data->delay && in_data->delay < ECHO_DEL_HI_LIM) {
		echo_data.delay = in_data->delay;
	}

	echo_data.dry_amp = in_data->dry_amp;
	echo_data.wet_amp = in_data->wet_amp;

	return true;
}

/**
 * Fetches the current parameters for the echo sound effect
 * @param  [in] None
 * @return Parameters currently used in for the echo sound effect
 */
echo_input_data_t echo_get(){
	echo_input_data_t data;
	data.delay = echo_data.delay;
	data.dry_amp = echo_data.dry_amp;
	data.wet_amp = echo_data.wet_amp;

	return data;
}
