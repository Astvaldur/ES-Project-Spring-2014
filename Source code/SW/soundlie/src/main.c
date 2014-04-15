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

    catch_interrupt(sample_irq, SAMPLE_IRQ_ID);
    enable_irq(SAMPLE_IRQ_ID);


	//PcConnectionInit();
	//printf(":");

    //catch_interrupt(irqhandler, 10);
    //enable_irq(10);
	//PcConnectionInit();
	//printf("1");

    //SET DEFAULT VALUES FOR ECHO AND TC HERE!

    //Infinite loop
    while(1);
 }


