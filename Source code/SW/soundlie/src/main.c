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
    catch_interrupt(irqhandler, 10);
    enable_irq(10);

    //Initialize variable values

    puts("Ready to rock!");

    //Infinite loop
    while(1);
 }


