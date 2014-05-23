/**
 * @file tone_control.c
 * @brief Tone control feature.
 * @details This filer implements the tone control feature by using 3 filters (LP, BP and HP). The filter coefficients can be set or changed by calling tc_set_filter_coeff().
 * @author Tobias Hallberg
 * @author Jonas Andersson
 * @version 1.0
 */

#include "tone_control.h"

/* Private functions ----------------------------------------------------*/
static int16_t tc_iir(iir_data_t *, circ_buff_t *);

/* Private variables ----------------------------------------------------*/
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

static tc_ctrl_data_t tc_amp_data = {
		0x400,
		0x400,
		0x400
};

/**
 * Initialize the tone control and set the default amplification levels
 */
void tc_init() {
	tc_ctrl_data_t tc_amp_data = {
			0x800,
			0x800,
			0x800
	};

	tc_set_amp(&tc_amp_data);
}

/**
 * Used for applying tone control to incoming signal
 * @param  [in]  circ_buff   Circular buffer containing input signal
 * @return Output signal from Tone Control.
 */
int16_t tc_amp(circ_buff_t *circ_buff) {

	/* Execute filter calculations */
	int16_t filt_lp = tc_iir(&iir_data_lp, circ_buff);
	int16_t filt_bp = tc_iir(&iir_data_bp, circ_buff);
	int16_t filt_hp = tc_iir(&iir_data_hp, circ_buff);

	/* Apply +- 12dB amplification */
	int32_t amp_lp = (int16_t)filt_lp * tc_amp_data.lp_amp;
	int32_t amp_bp = (int16_t)filt_bp * tc_amp_data.bp_amp;
	int32_t amp_hp = (int16_t)filt_hp * tc_amp_data.hp_amp;

	/* Calculate sum of amplified frequency bands */
	int32_t result = amp_lp + amp_bp + amp_hp;

	/* Shift bits after fixed point multiplication and return result */
	return (int16_t) (result >> 12);
}

/**
 * Implementation of IIR filter
 * @param  [in]  iir_data    Instance of iir_data_t, contains filter coefficients and buffer for wet signal.
 * @param  [in]  circ_buff   Circular buffer containing input signal
 * @return Output signal from IIR filter.
 */
int16_t tc_iir(iir_data_t *iir_data, circ_buff_t *circ_buff) {
	/* Declare and define loop variables n and sum to 0 */
	uint16_t n = 0;
	int32_t sum = 0;

	/* Perform IIR calculations for dry signal within loop */
	for (n = 0; n < iir_data->num_coeffs; n++) {
		/** Calc: tmp = tmp + (x_coeff * dry_signal) */
		sum += iir_data->coeffs_x[n] * circ_buff_get(circ_buff, n);
	}

	/* Perform IIR calculations for wet signal within loop */
	for (n = 1; n < iir_data->num_coeffs; n++) {
		/** Calc: tmp = tmp - (y_coeff * wet_signal) */
		sum -= iir_data->coeffs_y[n] * circ_buff_get( &(iir_data->buff_wet), n - 1);
	}

	/* Shift bits after fixed point multiplication */
	int16_t result = (int16_t) (sum >> 14);

	/** Push calculated signal into wet buffer */
	circ_buff_put(&(iir_data->buff_wet), result);

	return (int16_t) (result);
}

/**
 * Modifier method for amplification factors used in Tone Control.
 * @param  [in]  in_data    Instance of tc_ctrl_data_t, contains amplification factors for all frequency bands
 * @return Returns true if amplification factors were set successfully.
 */
void tc_set_amp(tc_ctrl_data_t *in_data){
	/* Copy values from input struct if they are valid */
	if (tc_amp_valid_value(in_data->lp_amp)) {
		tc_amp_data.lp_amp = in_data->lp_amp;
	}
	if (tc_amp_valid_value(in_data->bp_amp)) {
		tc_amp_data.bp_amp = in_data->bp_amp;
	}
	if (tc_amp_valid_value(in_data->hp_amp)) {
		tc_amp_data.hp_amp = in_data->hp_amp;
	}

}

/**
 * Access method for amplification factors used in Tone Control.
 * @return Returns and array containing the amplification factors used in Tone Control.
 */
tc_ctrl_data_t tc_get_amp(void){
	return tc_amp_data;
}

/**
 * Verifies that the amplification values are valid for use with TC
 * @param  [in]  value   Value to verify
 * @return Returns true if and only if the amplification value is valid.
 */
bool tc_amp_valid_value(int16_t value) {
	if (4 < value && value <= 0x2000) {
		return true;
	}
	else {
		return false;
	}
}

/**
 * Access method for IIR filter coefficients used in Tone Control.
 * @param  [in]  in_data    Instance of iir_input_data_t for filter.
 * @return Returns true if filter coefficients were set successfully.
 */
bool tc_set_filter_coeff(iir_input_data_t *in_data){
	iir_data_t *filter;
	if(in_data->taps <= IIR_MAX_COEFFS){
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

		filter->num_coeffs = in_data->taps;
		memcpy(filter->coeffs_x, in_data->x_data, in_data->taps*sizeof(int16_t));
		memcpy(filter->coeffs_y, in_data->y_data, in_data->taps*sizeof(int16_t));

	}else{
		//Not valid number of taps
		return false;
	}

	//Filter updated
	return true;
}
