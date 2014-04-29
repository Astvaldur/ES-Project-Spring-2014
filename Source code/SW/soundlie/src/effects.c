/**
* @file effects.c
* @brief Sounds effects and associated functions.
* @details Sounds effects and associated functions for use with circular buffer.
* @author Tobias Hallberg
* @version 1.0
*/

#include "effects.h"

//Declare/define variables with limited scope
static echo_data_t echo_data_alt;

static echo_data_t echo_data = { //REMOVE definition (keep declaration)
			24000,		//Delay: 0.5sec
			0x6000,		//Q1.15:0.75
			0x2000,		//Q1.15:0.25
			{0}			//Empty buffer
	};


/**
 * Used for applying the echo sound effect to the incoming signal
 * @param  [in]  dry_sample   Latest sample of input signal
 * @return Output signal from echo.
 */
int16_t echo(int16_t dry_samp) {

	// Get delayed wet signal from buffer
	int16_t wet_samp = circ_buff_get(&(echo_data.buff_wet), echo_data.delay);

	// Apply echo effect
	int32_t echo_calc = (dry_samp * echo_data.dry_amp) + (wet_samp * echo_data.wet_amp);

	// Perform bitshift to get correct result from Q1.15 x Q1.15 multiplication
	int16_t result = (int16_t) (echo_calc >> 15);

	// Push calculated signal into wet buffer
	circ_buff_put(&(echo_data.buff_wet), result);

	return result;
}

bool init_echo_alt()
{
	//echo_data_alt.delay = 24000;
	echo_data_alt.delay = 0;
	echo_data_alt.dry_amp = 0x6000;
	echo_data_alt.wet_amp = 0x2000;

	return true;
}
int16_t echo_alt(int16_t dry_samp) {

	// Get delayed wet signal from buffer
	int16_t wet_samp = circ_buff_get(&(echo_data_alt.buff_wet), echo_data_alt.buff_wet.pos - echo_data_alt.delay);

	// Apply echo effect
	int32_t echo_calc = (dry_samp * echo_data_alt.dry_amp) + (wet_samp * echo_data_alt.wet_amp);

	// Perform bitshift to get correct result from Q1.15 x Q1.15 multiplication
	int16_t result = (int16_t) (echo_calc >> 15);

	// Push calculated signal into wet buffer
	circ_buff_put(&(echo_data_alt.buff_wet), result);

	return result;
}

bool set_echo_alt(echo_input_data_t *in_data){
	echo_data_alt.delay = in_data->delay;
	echo_data_alt.dry_amp = in_data->dry_amp;
	echo_data_alt.wet_amp = in_data->wet_amp;

	return true;
}
