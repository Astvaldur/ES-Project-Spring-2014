#include "tone_control.h"


int16 tc_fir(fir_data_t fir_data, circ_buff_t *circ_buff) {
	int n = 0;
	int tmp = 0;

	for (n = 0; n < fir_data.num_coeffs; n++) {
		tmp = tmp + ( (fir_data.coeffs[n] * circ_buff_get(circ_buff, circ_buff->pos - n)) );
	}

	//Do shifting here to save cpu time
	return (int16) (tmp >> 16);

}


