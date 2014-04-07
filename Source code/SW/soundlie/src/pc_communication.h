/*
 * pc_connection.h
 *
 *  Created on: Mar 24, 2014
 *      Author: David
 */

#ifndef PC_CONNECTION_H_
#define PC_CONNECTION_H_

//Macro
#define UART_ADDRESS (int*)0x80000100
#define MSG_SIZE 17						//includes terminator '\0'
#define MSG_TERMINATOR 'X'				//select the terminator of the message.
#define DATA_FIELD_LENGTH 10
#define UART_INTERRUP_NR 2

//Functions
void PcConnectionInit();
void PcConnectionHandler();
void ReadFromUart();
void SendCharBuffer();
void ResetPcConnectionParameters();
int CheckMessageContent();
int CheckIsMessageComplete();
int GetMessageType();
int ReadAndReturnDataField();
int VerifyChecksum();

#endif /* PC_CONNECTION_H_ */
