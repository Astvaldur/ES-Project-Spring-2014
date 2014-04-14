#include "tone_control.h"


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
		{13116, 39303, 13116},
		{1, 39960, 10507},
		{0, {0}}
};

/**
 * Used for applying tone control to incoming signal
 * @param  [in]   a   I just like sending Integers.
 * @param  [out] b   Doubles are nice as well.
 * @param  [in,out] string     But I like strings the most.
 * @return Result from filter calculations.
 */
int16_t tc_amp(circ_buff_t *circ_buff) {



	//Execute filter calculations
	int16_t filt_lp = tc_iir(&iir_data_lp, circ_buff);			//Use LP-filter
	int16_t filt_bp = tc_iir(&iir_data_bp, circ_buff);			//Use BP-filter
	int16_t filt_hp = tc_iir(&iir_data_hp, circ_buff);			//Use HP-filter

	//Testing stuff...
	/*int32_t filt_lp_32 = filt_lp << 16;
	int32_t filt_bp_32 = filt_bp << 16;
	int32_t filt_hp_32 = filt_hp << 16;*/

	//Add +- 12dB amplification here!
	//int32_t result = (int32_t) (filt_lp + filt_bp + filt_hp);
	//return (int16_t) (result >> 16);
	//return (int16_t) ( ((filt_lp + filt_bp + filt_hp)*32612) >> 13);


	return (int16_t) (filt_lp + filt_bp + filt_hp);
}


int16_t tc_iir(iir_data_t *iir_data, circ_buff_t *circ_buff) {
	uint16_t n = 0;
	int32_t tmp = 0;

	for (n = 0; n < iir_data->num_coeffs; n++) {
		// tmp = tmp + (x_coeff * dry_signal)
		tmp = tmp + (iir_data->coeffs_x[n] * circ_buff_get(circ_buff, circ_buff->pos - n));
	}

	for (n = 1; n < iir_data->num_coeffs; n++) {
		// tmp = tmp - (y_coeff * wet_signal)
		tmp = tmp - (iir_data->coeffs_y[n] * circ_buff_get(&(iir_data->buff_wet), iir_data->buff_wet.pos - n + 1));
	}

	//Do shifting here to save cpu time
	int16_t result = (int16_t) (tmp >> 14);
	//Testing stuff...
	//int16_t result = (int16_t) (tmp >> 16);

	// Push calculated signal into wet buffer
	circ_buff_put(&(iir_data->buff_wet), result);

	return result;

}


int16_t tc_fir(fir_data_t fir_data, circ_buff_t *circ_buff) {
	uint16_t n = 0;
	int32_t tmp = 0;

	for (n = 0; n < fir_data.num_coeffs; n++) {
		tmp = tmp + ( (fir_data.coeffs[n] * circ_buff_get(circ_buff, circ_buff->pos - n )) );
	}

	//Do shifting here to save cpu time
	return (int16_t) (tmp >> 15);

}

bool tc_set_filter_coeff(iir_input_data *in_data){

	if(in_data->taps <= IIR_MAX_COEFFS){
		iir_data_t *filter;
		switch(in_data.type)
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
		memcpy(filter.coeffs_x, in_data->x_data, in_data->taps*sizeof(int16_t));
		memcpy(filter.coeffs_y, in_data->y_data, in_data->taps*sizeof(int16_t));

	}else{
		//Not valid number of taps
		return false;
	}

	//Filter updated
	return true;
}


