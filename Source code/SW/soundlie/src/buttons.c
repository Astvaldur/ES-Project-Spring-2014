/**
 * @file buttons.c
 * @brief Handler of physical buttons
 * @details Driver interface for reading data from XADC module located on APB-bus.
 * @author Tobias Hallberg
 * @version 1.0
 */

#include "buttons.h"

void buttons_init_gpio(void);

/**
 * Polling based interface for buttons that sets audio processing parameters
 * @param  [in] None
 * @return None
 */
void buttons_poll(){
	buttons_init_gpio();

	audiopath_t ap_state;
	tc_ctrl_data_t tc_state;
	echo_input_data_t ec_state;

	while (1) {
		volatile int16_t in_data = gpio_read(GPIO_APB);

		if (in_data & (1 << BUTN_U)) {
			int32_t eval = in_data & ACT_BUTN;
			switch (eval) {
			case (1 << SW_TC_EN) :
				ap_state = audiopath_get();
				ap_state.tc_enable = true;
				audiopath_set(&ap_state);
				break;

			case (1 << SW_TC_BAS) :
				tc_state = tc_get_amp();
				tc_state.lp_amp = (int16_t)(tc_state.lp_amp * THREE_DB);
				tc_set_amp(&tc_state);
				break;

			case (1 << SW_TC_MID) :
				tc_state = tc_get_amp();
				tc_state.bp_amp = (int16_t)(tc_state.bp_amp * THREE_DB);
				tc_set_amp(&tc_state);
				break;

			case (1 << SW_TC_TRE) :
				tc_state = tc_get_amp();
				tc_state.hp_amp = (int16_t)(tc_state.hp_amp * THREE_DB);
				tc_set_amp(&tc_state);
				break;

			case (1 << SW_ECHO_EN) :
				ap_state = audiopath_get();
				ap_state.effects_enable = ECHO;
				audiopath_set(&ap_state);
				break;
			case (1 << SW_ECHO_DEL) :
				ec_state = echo_get();
				ec_state.delay = ec_state.delay + ECHO_DEL_STEP;
				echo_set(&ec_state);
				break;

			case (1 << SW_ECHO_AMP) :
				ec_state = echo_get();
				ec_state.wet_amp = ec_state.wet_amp + ECHO_AMP_STEP;
				ec_state.dry_amp = ECHO_TOT_POW - ec_state.wet_amp;
				echo_set(&ec_state);
				break;
			}

		}
		if (in_data & (1 << BUTN_D)) {
			int32_t eval = in_data & 0x3FF00;
			switch (eval) {
			case (1 << SW_TC_EN) :
				ap_state = audiopath_get();
				ap_state.tc_enable = false;
				audiopath_set(&ap_state);
				break;

			case (1 << SW_TC_BAS) :
				tc_state = tc_get_amp();
				tc_state.lp_amp = (int16_t)(tc_state.lp_amp / THREE_DB);
				tc_set_amp(&tc_state);
				break;

			case (1 << SW_TC_MID) :
				tc_state = tc_get_amp();
				tc_state.bp_amp = (int16_t)(tc_state.bp_amp / THREE_DB);
				tc_set_amp(&tc_state);
				break;

			case (1 << SW_TC_TRE) :
				tc_state = tc_get_amp();
				tc_state.hp_amp = (int16_t)(tc_state.hp_amp / THREE_DB);
				tc_set_amp(&tc_state);
				break;

			case (1 << SW_ECHO_EN) :
				ap_state = audiopath_get();
				ap_state.effects_enable = OFF;
				audiopath_set(&ap_state);
				break;
			case (1 << SW_ECHO_DEL) :
				ec_state = echo_get();
				ec_state.delay = ec_state.delay - ECHO_AMP_STEP;
				echo_set(&ec_state);
				break;

			case (1 << SW_ECHO_AMP) :
				ec_state = echo_get();
				ec_state.wet_amp = ec_state.wet_amp - ECHO_AMP_STEP;
				ec_state.dry_amp = ECHO_TOT_POW - ec_state.wet_amp;
				echo_set(&ec_state);
				break;
			}
		}

		/* Center button pressed, may be used to reset to default values in future implementation */
		/*if (in_data & (1 << BUTN_C)) {
			gpio_write(GPIO_APB, 1 << LED_B);
		}*/

		/* Wait until button has been released */
		while((in_data & 0x1F) != 0){
			in_data = gpio_read(GPIO_APB);
		}

	}
}

/**
 * Initialize button interface
 * @param  [in] None
 * @return None
 */
void buttons_init_gpio(){

	gpio_init(GPIO_APB);

	//Set 3 MSB to outputs
	gpio_set_pin_dir(GPIO_APB, 0xE0);

	//Disable all output signals
	gpio_write(GPIO_APB, 0);
}

