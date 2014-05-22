/**
* @file pc_communication.h
* @brief Header file for the PC communication code.
* @details The PC communication header file gives access to the functions
* enabling and handling communications over UART.
* @author David Alm
* @version 1.0
*/

#ifndef PC_CONNECTION_H_
#define PC_CONNECTION_H_

#include <stdint.h>
#include "uart.h"
///< Access to control the UART
#include "irq.h"
///< Used to configure and enable execution with interrupts
#include "tone_control.h"
///< When configuring the tone control and echo we call function available here.
#include "datatypes.h"
///< To set new configurations data structures from this file is used to store the new values.
#include "main.h"

//Functions
void PcConnectionInit();
void PcConnectionHandler();


#endif /* PC_CONNECTION_H_ */
