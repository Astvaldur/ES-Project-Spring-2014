/**
 * @file buttons.c
 * @brief Handler of physical buttons
 * @details Driver interface for reading data from XADC module located on APB-bus.
 * @author Tobias Hallberg
 * @version 1.0
 */

#include "buttons.h"

void gpio1_init(void);

void buttons_init(){
	gpio1_init();



	while (1) {
		volatile int16_t in_data = gpio_read(GPIO_APB);

		if (in_data & (1 << BUTN_U)) {
			if (in_data & (1 << SW_0)){
				tc_ctrl_data_t tmp = tc_get_amp();
				if(tmp.lp_amp <= 0x2000){
					tmp.lp_amp = tmp.lp_amp*2;
					tc_set_amp(&tmp);
				}

			}if (in_data & (1 << SW_1)) {
				tc_ctrl_data_t tmp = tc_get_amp();
				if(tmp.bp_amp <= 0x2000){
					tmp.bp_amp = tmp.bp_amp*2;
					tc_set_amp(&tmp);
				}

			}if (in_data & (1 << SW_2)) {
				tc_ctrl_data_t tmp = tc_get_amp();
				if(tmp.hp_amp <= 0x2000){
					tmp.hp_amp = tmp.hp_amp*2;
					tc_set_amp(&tmp);
				}
			}

		}
		if (in_data & (1 << BUTN_D)) {
			if (in_data & (1 << SW_0)){
				tc_ctrl_data_t tmp = tc_get_amp();
				tmp.lp_amp = tmp.lp_amp/2;
				tc_set_amp(&tmp);

			}if (in_data & (1 << SW_1)) {
				tc_ctrl_data_t tmp = tc_get_amp();
				tmp.bp_amp = tmp.bp_amp/2;
				tc_set_amp(&tmp);

			}if (in_data & (1 << SW_2)) {
				tc_ctrl_data_t tmp = tc_get_amp();
				tmp.hp_amp = tmp.hp_amp/2;
				tc_set_amp(&tmp);
			}

		}

		if (in_data & (1 << BUTN_C)) {
			gpio_write(GPIO_APB, 1 << LED_B);

		}

		while((in_data & 0x1F) != 0){
			in_data = gpio_read(GPIO_APB);
		}


		//Turn off leds
		gpio_write(GPIO_APB, 0);

	}

}

void gpio1_init(){
	//Set 3 MSB to outputs
	gpio_set_pin_dir(GPIO_APB, 0xE0);

	//Disable all output signals
	gpio_write(GPIO_APB, 0);
}

