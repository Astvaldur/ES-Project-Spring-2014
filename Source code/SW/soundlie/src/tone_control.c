#include "tone_control.h"

extern fir_data_t tc_lp;
extern fir_data_t tc_bp;
extern fir_data_t tc_hp;

/**
* Used for applying tone control to incoming signal
* @param  [in]   a   I just like sending Integers.
* @param  [out] b   Doubles are nice as well.
* @param  [in,out] string     But I like strings the most.
* @return Result from filter calculations.
*/
int16_t tc_amp(circ_buff_t *circ_buff) {
	//Read sample for straight through testing
	int16_t tmp = circ_buff_get(circ_buff, circ_buff->pos);

	//Execute filter calculations
	//int16_t filt_lp = tc_fir(tc_lp, circ_buff); //Use LP-filter
	//int16_t filt_bp = tc_fir(tc_bp, circ_buff); //Use BP-filter
	//int16_t filt_hp = tc_fir(tc_hp, circ_buff); //Use HP-filter

	//Add +- 12dB amplification here!
	//return (int16_t) (filt_lp + filt_bp + filt_hp);
	return tmp;
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
