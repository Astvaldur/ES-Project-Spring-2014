/*
 * pc_communication.c
 *
 *  Created on: Mar 24, 2014
 *      Author: David
 */

#include "pc_communication.h"
#include "uart.h"			//to read,write and initialize uart
#include "irq.h"			//to be able to enable interrupts for uart
#include "applications.h"
#include "main.h"

//Array to store chars until the whole message is sent. 16 chars + terminator.
char uart_char_buffer[MSG_SIZE] = { 0 };
//Index for the buffer.
int uart_char_buffer_index = 0;
//message_complete is used to alter between receiving and reading the message.
int message_complete = 0;
//receiving is used to signal if were recieving a message or not.
int receiving = 0;

//initialization function to setup the whole pc communication
void PcConnectionInit() {
	//make sure everything is reset.
	ResetPcConnectionParameters();
	//call on InitUart
	InitUart();
	//bind which function should be called when interrupt occurs on uart.
	catch_interrupt(PcConnectionHandler, UART_INTERRUP_NR);
	//enable interrupts for uart in the system.
	enable_irq(UART_INTERRUP_NR);
}

//This function handles the pc communication when interrupt occurs.
void PcConnectionHandler() {
	printf(".");
	//disable interrupts for uart.
	disable_irq(UART_INTERRUP_NR);
	//check the status of the uart.
	int status = UartStatus();
	if (status == 1) {
		//Data Ready (DR), retrieve data.
		ReadFromUart();
	}
	//if the message is complete and handle it.
	if (CheckIsMessageComplete()) {
		// check the that the checksum is correct.
		if (VerifyChecksum()) {
			//The message had content & checksum. read it & handle it.
			//Get the type of message
			int msg_type = GetMessageType();
			//switchcase used to deciede what to do.
			switch (msg_type) {
			case 0:
				//set value in a filter
				SendCharBuffer();  //print to see it worked.
				break;
			case 1:
				//set value in a filter
				break;
			case 2:
				//set value in a filter
				break;
			case 5:
				//activate the effect
				break;
			case 7:
				//set base value
				break;
			case 8:
				//set middle value
				break;
			case 9:
				//set treble value
				break;
			default:
				; //if we enter here the message was undefined.
			} //end of switch
			  //message has been handled. reset
			ResetPcConnectionParameters();
		} else {
			//the checksum was incorrect reset and wait for a new message.
			ResetPcConnectionParameters();
		}			//end of checksum if.
	}			//end of messagecomplete if.

	//enable interrupts again.
	enable_irq(UART_INTERRUP_NR);
}

//Read char from the uart buffer.
void ReadFromUart() {
	//get the char from the uart buffer.
	char uart_char = ReadUartChar();
	//The character is checked only if a message is not complete.
	if (message_complete == 0) {
		//check if it is the first char of a message.
		if ((uart_char == 'S') && (receiving == 0)) {
			//if it is the first char we start storing.
			uart_char_buffer[uart_char_buffer_index] = uart_char;
			//increment the index
			uart_char_buffer_index++;
			//change the state of receiving to 1 since were in the middle of recieving a message.
			receiving = 1;
		} else if (receiving == 1) {
			//If it is not the first char we continue to read in chars until full
			uart_char_buffer[uart_char_buffer_index] = uart_char;
			//increment index.
			uart_char_buffer_index++;
			//when the message is read in the content is checked and message_complete is signaled.
			if (uart_char_buffer_index == MSG_SIZE) {
				// check if the content of the message is valid.
				if (CheckMessageContent()) {
					//the content was valid.
					message_complete = 1;
				} else {
					//something in the message was not correct so reset is done.
					ResetPcConnectionParameters();
				}
			}
		}
	}			//end of message_complete if.
}

//This function will print the received message
void SendCharBuffer() {
	//send the buffer to the uart write function to be printed.
	int buffer_index = 0;
	int not_finished = 1;
	//loop until the buffer is sent.
	while (not_finished) {
		//retrieve the uart status.
		int uart_status = UartStatus();
		if (uart_status == 2) {
			//we can send a char.
			SendCharOnUart(uart_char_buffer[buffer_index]);
			//increment the index
			buffer_index++;
		}			//end of uart status.
		if (buffer_index >= MSG_SIZE) {
			not_finished = 0;
		}
	}			//end of while.
}

//when a complete message is read all variables are reset.
void ResetPcConnectionParameters() {
	//message_complete reseted
	message_complete = 0;
	//uart buffer index reseted
	uart_char_buffer_index = 0;
	//receiving is set to 0 so we can receive a new message.
	receiving = 0;

	//set the buffer 0, 0 = NUL in ascii.
	for (i = 0; i < MSG_SIZE; i++) {
		uart_char_buffer[i] = 0;
	}
}

//help function used to verify that there are no illegal
//letters or characters.
int CheckMessageContent() {
	int valid_content = 1;
	//check it the first char is 'S' and last is a terminator '\0'
	if (uart_char_buffer[0] == 'S' && uart_char_buffer[MSG_SIZE - 1] == MSG_TERMINATOR) {
		//if the first letter and last char is valid the rest of the message is checked that it contains digits only.
		for (i = 1; i < MSG_SIZE - 1; i++) {
			//check one char on each loop iteration and check that theyre in valid range.
			if ((uart_char_buffer[i] < '0') || (uart_char_buffer[i] > '9')) {
				//if this if statement is entered then atleast on letter is invalid.
				valid_content = 0;
			}
		}			//end of for
		// end of first letter if check.
		//return the result
		return valid_content;
	} else {
		return 0; //return 0 if one of the starting letters were incorrect.
	}

}

//message_complete is set.
int CheckIsMessageComplete() {
	return message_complete;
}

//reads the message type and returns it.
int GetMessageType() {
	//read the type of message and return it as integer.
	int msg_type;
	char msg_char = uart_char_buffer[1];
	//check if the char is in the valid range of 0 to 9.
	if (msg_char >= '0' && msg_char <= '9') {
		//if it is in the valid range we assign it to an int by subtracting '0'.
		msg_type = msg_char - '0';
	} else {
		//if it was not in the valid range then the message type does not exist.
		//The message should not be parsed so a error value is used.
		msg_type = -1;
	}
	//return the message type
	return msg_type;
}

//read the characters from the data field in the message and convert to integer and return.
int ReadAndReturnDataField() {
	//array to store characters from the data field in the message.
	char data_field_chars[DATA_FIELD_LENGTH];

	//read each character from the data field.
	for (i = 0; i < DATA_FIELD_LENGTH; i++) {
		//read a char on each iteration through the loop.
		data_field_chars[i] = uart_char_buffer[i + 4];
	}

	//convert the number with atoi.
	int data_field_int = atoi(data_field_chars);
	//return the data field number as integer.
	return data_field_int;
}

//control the checksum and signal if correct or invalid.
int VerifyChecksum() {
	//using calculated checksum to store the calculated checksum.
	int calculated_checksum = 0;
	//array to store the digit pairs before converting to integer.
	char digit_pair[2];
	//go through the message and add all the numbers to checksum.
	for (i = 2; i < MSG_SIZE - 3; i += 2) {
		//read the char digits.
		digit_pair[0] = uart_char_buffer[i];
		digit_pair[1] = uart_char_buffer[i + 1];
		//convert the chars to integer.
		int number = atoi(digit_pair);
		//add the number to the checksum
		calculated_checksum += number;
	}

	//check if the number is so big that it is represented by three digits.
	//if it is then we subract enough so it becomes two digit.
	if (calculated_checksum >= 200) {
		//the checksum is larger than 200. Subtract 200
		calculated_checksum -= 200;
	} else if (calculated_checksum >= 100) {
		//the checksum is larger than 100 only. subtract 100.
		calculated_checksum -= 100;
	}

	//retrieve the checksum from the message
	digit_pair[0] = uart_char_buffer[MSG_SIZE - 2];
	digit_pair[1] = uart_char_buffer[MSG_SIZE - 1];
	//convert message checksum to integer.
	int recieved_checksum = atoi(digit_pair);

	int cmp_result;
	//compare with the checksum in the message
	if (recieved_checksum == calculated_checksum) {
		//if the checksum is correct signal 1.
		cmp_result = 1;
	} else {
		//if the checksums signal 0.
		cmp_result = 0;
	}
	return cmp_result;
}
