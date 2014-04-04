#include "tone_control.h"


int16_t tc_fir(fir_data_t fir_data, circ_buff_t *circ_buff) {
	uint16_t n = 0;
	int32_t tmp = 0;

	for (n = 0; n < fir_data.num_coeffs; n++) {
		tmp = tmp + ( (fir_data.coeffs[n] * circ_buff_get(circ_buff, circ_buff->pos - n)) );
	}
	//int16_t tmp2 = 0x1000;



	//tmp = circ_buff_get(circ_buff, circ_buff->pos) * tmp2;

	//Do shifting here to save cpu time
	return (int16_t) (tmp >> 15);

}
