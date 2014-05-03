/**
 * @file main.c
 * @brief Main program file.
 * @details Main program file for soundlie project.
 * @author Viktor Jarenfors
 * @author Tobias Hallberg
 * @author Jonas Andersson
 * @author David Alm
 * @version 1.0
 */

//Include Libraries
#include "main.h"

int main()
{
	/* Test code -----------------------------------------------------*/
	//catch_interrupt(buttons_irq, 10);
	//enable_irq(10);


	/* Proper code ---------------------------------------------------*/

	/* Initialize audio path */
	audiopath_init();

	/* Initialize pc connection */
	PcConnectionInitHex();

	/* Initialize tone control */
	tc_init();

	/* Initialize echo sound effect */
	echo_init();

	/* Initialize buttons */
	buttons_init();

	//Infinite loop
	while(1);
}


