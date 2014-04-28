/**
 * @file tone_control.c
 * @brief Tone control feature.
 * @details This filer implements the tone control feature by using 3 filters (LP, BP and HP). The filter coefficients can be set or changed by calling tc_set_filter_coeff().
 * @author Tobias Hallberg, Jonas Andersson
 * @author Jonas Andersson
 * @version 1.0
 */

#include "tone_control.h"

/* Private functions ----------------------------------------------------*/
static int16_t tc_iir(iir_data_t *, circ_buff_t *);

static iir_data_t iir_data_lp = {
		3,
		{6, 12, 6},
		{1, 33677, 15498},
		{0, {0}}
};
static iir_data_t iir_data_bp = {
		3,
		{1990, 0, 63545},
		{1, 36928, 12402},
		{0, {0}}
};
static iir_data_t iir_data_hp = {
		3,
		{13116, -26234, 13116},
		{1, 39960, 10507},
		{0, {0}}
};

/**
 * Used for applying tone control to incoming signal
 * @param  [in]  circ_buff   Circular buffer containing input signal
 * @return Output signal from Tone Control.
 */
int16_t tc_amp(circ_buff_t *circ_buff) {

	/** Execute filter calculations */
	int16_t filt_lp = tc_iir(&iir_data_lp, circ_buff);			//Use LP-filter
	int16_t filt_bp = tc_iir(&iir_data_bp, circ_buff);			//Use BP-filter
	int16_t filt_hp = tc_iir(&iir_data_hp, circ_buff);			//Use HP-filter

	/** Apply +- 12dB amplification */
	int32_t amp_lp = (int16_t)filt_lp * ((int16_t)(0x4000));
	int32_t amp_bp = (int16_t)filt_bp * ((int16_t)(0x1000));
	int32_t amp_hp = (int16_t)filt_hp * ((int16_t)(0x1000));

	/** Calculate sum of amplified frequency bands */
	int32_t result = amp_lp + amp_bp + amp_hp;

	/** Shift bits after fixed point multiplication and return result */
	//(Do shifting here to save cpu time)
	return (int16_t) (result >> 13);
}

/**
 * Implementation of IIR filter
 * @param  [in]  iir_data    Instance of iir_data_t, contains filter coefficients and buffer for wet signal.
 * @param  [in]  circ_buff   Circular buffer containing input signal
 * @return Output signal from IIR filter.
 */
int16_t tc_iir(iir_data_t *iir_data, circ_buff_t *circ_buff) {
	/** Declare and define loop variables n and sum to 0 */
	uint16_t n = 0;
	int32_t sum = 0;

	/** Perform IIR calculations for dry signal within loop */
	for (n = 0; n < iir_data->num_coeffs; n++) {
		/** Calc: tmp = tmp + (x_coeff * dry_signal) */
		sum += iir_data->coeffs_x[n] * circ_buff_get(circ_buff, n);
		//tmp = tmp + ((iir_data->coeffs_x[n]) * (circ_buff_get(circ_buff, n)));					//remove this row after test
	}

	/** Perform IIR calculations for wet signal within loop */
	for (n = 1; n < iir_data->num_coeffs; n++) {
		/** Calc: tmp = tmp - (y_coeff * wet_signal) */
		sum -= iir_data->coeffs_y[n] * circ_buff_get( &(iir_data->buff_wet), n - 1);
		//tmp = tmp - ((iir_data->coeffs_y[n]) * ( circ_buff_get(&(iir_data->buff_wet), n - 1)));	//remove this row after test
	}

	//tmp = tmp * ((int32_t)(0x40000000));															//Test junk

	/** Shift bits after fixed point multiplication */
	//(Do shifting here to save cpu time)
	int16_t result = (int16_t) (sum >> 14);

	//int32_t result_64 = (int16_t) result * ((int16_t)(0x1000));									//Test junk

	/** Push calculated signal into wet buffer */
	circ_buff_put(&(iir_data->buff_wet), result);

	return (int16_t) (result);
	//return (int16_t) (result_64 >> 13);															//Test junk
}

/**
 * Access method for IIR filter coefficients used in Tone Control.
 * @param  [in]  iir_data    Instance of iir_input_data_t, contains filter coefficients and buffer for wet signal.
 * @param  [in]  circ_buff   Circular buffer containing input signal
 * @return Output signal from IIR filter.
 */
bool tc_set_filter_coeff(iir_input_data_t *in_data){

	if(in_data->taps <= IIR_MAX_COEFFS){
		iir_data_t *filter;
		switch(in_data->type)
		{
		case FILTER_LP:
			filter = &iir_data_lp;
			break;
		case FILTER_MID:
			filter = &iir_data_bp;
			break;
		case FILTER_HP:
			filter = &iir_data_hp;
			break;
		}

		iir_data_hp.num_coeffs = in_data->taps;
		memcpy(filter->coeffs_x, in_data->x_data, in_data->taps*sizeof(int16_t));
		memcpy(filter->coeffs_y, in_data->y_data, in_data->taps*sizeof(int16_t));

	}else{
		//Not valid number of taps
		return false;
	}

	//Filter updated
	return true;
}
