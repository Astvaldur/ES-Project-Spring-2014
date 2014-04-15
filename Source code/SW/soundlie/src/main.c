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
    //Initialize hw config
    catch_interrupt(sample_irq, 10);
    enable_irq(10);
	//printf(":");

	//TEST
	iir_input_data in_data;
	in_data.taps = 3;
	in_data.type = FILTER_HP;
	int16_t x_val[] = {6, 12, 6};
	int16_t y_val[] = {1, 33677, 15498};
	in_data.x_data = x_val;
	in_data.y_data = y_val;

	//tc_set_filter_coeff(&in_data);



	//catch_interrupt(irqhandler, 10);
    //enable_irq(10);
	//PcConnectionInit();
	//printf("1");

    //SET DEFAULT VALUES FOR ECHO AND TC HERE!

    //Infinite loop
    while(1);
 }


