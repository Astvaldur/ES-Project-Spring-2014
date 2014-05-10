/**
* @file chorus.c
* @brief Sounds effects and associated functions.
* @details Sounds effects and associated functions for use with circular buffer.
* @author Tobias Hallberg
* @author Jonas Andersson
* @version 1.0
*/

#include "chorus.h"

//Declare/define variables with limited scope
static chorus_data_t chorus_data;

/**
 * Used for applying the chorus sound effect to the incoming signal
 * @param  [in]  dry_sample   Latest sample of input signal
 * @return Output signal from chorus.
 */
int16_t chorus(int16_t dry_samp) {

	/* Store dry signal in buffer */
	circ_buff_put(&(chorus_data.buff_dry), dry_samp);

	/*int16_t buff_offset = 200 * sin((3/20)*2*M_PI*t1);

	t1 = t1 + 3/Sine_y_FS;*/

	/* Get delayed wet signal from buffer */
	//int16_t wet_samp = circ_buff_get(&(chorus_data.buff_wet), chorus_data.delay);

	/* Apply chorus effect */
	//int32_t chorus_calc = (dry_samp * chorus_data.dry_amp) + (wet_samp * chorus_data.wet_amp);

	/* Perform bitshift to get correct result from Q1.15 x Q1.15 multiplication */
	//int16_t result = (int16_t) (chorus_calc >> 15);

	/* Push calculated signal into wet buffer */
	//circ_buff_put(&(chorus_data.buff_wet), result);

	int result = 1;
	return result;
}

/**
 * Initialize the chorus sound effect and set the default settings
 * @param  None
 * @return Returns true
 */
bool chorus_init()
{
	chorus_data.delay = 24000;
	chorus_data.dry_amp = 0x4000;
	chorus_data.wet_amp = 0x4000;

	return true;
}

/**
 * Sets the parameters for the chorus sound effect
 * @param  [in] Data structure containing the parameter values to be set
 * @return Returns true
 */
bool chorus_set(chorus_input_data_t *in_data){
	chorus_data.delay = in_data->delay;
	chorus_data.dry_amp = in_data->dry_amp;
	chorus_data.wet_amp = in_data->wet_amp;

	return true;
}

/**
 * Fetches the current parameters for the chorus sound effect
 * @param  [in] None
 * @return Parameters currently used in for the chorus sound effect
 */
chorus_input_data_t chorus_get(){
	chorus_input_data_t data;
	data.delay = chorus_data.delay;
	data.dry_amp = chorus_data.dry_amp;
	data.wet_amp = chorus_data.wet_amp;

	return data;
}
