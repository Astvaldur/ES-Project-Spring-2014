/*
 * pc_connection.h
 *
 *  Created on: Mar 24, 2014
 *      Author: David
 */

#ifndef PC_CONNECTION_H_
#define PC_CONNECTION_H_

#include <stdint.h>
#include "uart.h"			//to read,write and initialize uart
#include "irq.h"			//to be able to enable interrupts for uart
#include "datatypes.h"
#include "applications.h"
#include "main.h"

//Macro
#define UART_ADDRESS (int*)0x80000100
#define MSG_SIZE 17						//includes terminator '\0'
#define MAX_MSG_SIZE 209				// 208 ASCII + terminator.
#define MSG_TERMINATOR 'x'				//select the terminator of the message.
#define DATA_FIELD_LENGTH 10
#define UART_INTERRUP_NR 2

//Functions
void PcConnectionInit();
void PcConnectionHandler();
void ReadFromUart();
void SendCharBuffer();
int CheckMessageContent();
int GetMessageType();
int ReadAndReturnDataField();
int VerifyChecksum();
void SendAChar();

void PcConnectionInitHex();
void PcConnectionHandlerHex();


#endif /* PC_CONNECTION_H_ */
