/**
* @file main.c
* @brief Main program file.
* @details Main program file for soundlie project.
* @author Viktor Jarenfors
* @author Tobias Hallberg
* @version 1.0
*/

//Include Libraries
#include "main.h"

int main()
 { 
    //echo_input_data alt;
    //alt.delay = 48000;
    //alt.dry_amp = 0x6000;
    //alt.wet_amp = 0x2000;
    //set_echo_alt(&alt);


	//Initialize hw config
	PcConnectionInitHex();

    catch_interrupt(sample_irq, 10);
    enable_irq(10);

    buttons_init();

    tc_ctrl_data_t tc_amp_data = {
    		0x400,
    		0x400,
    		0x400
    };

    tc_set_amp(&tc_amp_data);


	//printf(":");

    /*
	//TEST
	iir_input_data in_data;
	in_data.taps = 3;
	in_data.type = FILTER_LP;
	int16_t x_val[IIR_MAX_COEFFS] = {0};
	x_val[0] = 6;
	x_val[1] = 12;
	x_val[2] = 6;
	int16_t y_val[IIR_MAX_COEFFS] = {0};
	y_val[0] = 1;
	y_val[1] = 33677;
	y_val[2] = 3117;

	in_data.x_data = x_val;
	in_data.y_data = y_val;

	bool result = tc_set_filter_coeff(&in_data);
	if (result) {
	//	SendCharOnUart('!');
	} else {
		//SendCharOnUart('?');
	}
*/

	//catch_interrupt(irqhandler, 10);
    //enable_irq(10);
	//PcConnectionInit();
	//printf("1");

    //SET DEFAULT VALUES FOR ECHO AND TC HERE!

    //Infinite loop
    while(1);
 }


