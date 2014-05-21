/**
 * @file main.c
 * @brief Main program file.
 * @details Main program file for Soundlie project.
 * @author Viktor Jarenfors
 * @author Tobias Hallberg
 * @author Jonas Andersson
 * @author David Alm
 * @version 1.0
 */

/* Include Libraries */
#include "main.h"

int main()
{
	/* Initialize audio path */
	audiopath_init();

	/* Initialize pc connection */
	PcConnectionInit();

	/* Initialize tone control */
	tc_init();

	/* Initialize echo sound effect */
	echo_init();

	/* Initialize buttons */
	buttons_poll();

	//Infinite loop
	while(1);
}


