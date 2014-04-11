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

//help function prototypes
static int CheckMessageContentHex();
static int CheckIsMessageComplete();
static void ResetPcConnectionParameters();
static int VerifyChecksumHex();
static void ReadFromUartHex();
static int HexToInt(char hexes[]);

//char buffer set at the maximum msg size accepted
char uart_hex_buffer[MAX_MSG_SIZE] = { 0 };
//integer to store the length of the received message. Minimum length is 8
int msg_length = 8;
//buffer index
int uart_hex_buffer_index = 0;

//older code
//Array to store chars until the whole message is sent. 16 chars + terminator.
char uart_char_buffer[MSG_SIZE];
//Index for the buffer.
int uart_char_buffer_index = 0;
//message_complete is used to alter between receiving and reading the message.
int message_complete = 0;
//receiving is used to signal if were recieving a message or not.
int receiving = 0;
//index used when sending.
int send_index = 0;
//sending variable. used to determine if the current message is to be sent.
int sending = 0;


void PcConnectionInitHex() {
	//make sure everything is reset.
	ResetPcConnectionParameters();
	//call on InitUart
	InitUart();
	//bind which function should be called when interrupt occurs on uart.
	catch_interrupt(PcConnectionHandlerHex, UART_INTERRUP_NR);
	//enable interrupts for uart in the system.
	enable_irq(UART_INTERRUP_NR);
}

//newer function to handle reading and handling the messages.
void PcConnectionHandlerHex() {
	disable_irq(UART_INTERRUP_NR); //Disable interrupts
	if (UartReadStatus() == 1) { //When the uartstatus == 1. then data ready (DR).
		ReadFromUartHex();
	}
	if (CheckIsMessageComplete()) {
		if (CheckMessageContentHex() && VerifyChecksumHex()) { //Verify that message content and checksum is valid
			int msg_type = GetMessageType(); //with the message type we know what to do.
			switch (msg_type) {
			case 1:
				//first case.
				break;
			default:
				;
			}//end of switch
			ResetPcConnectionParameters();
		} else {//end of checkmessage/verifychecksum if.
			ResetPcConnectionParameters(); //reset if something was invalid in the message.
		}
	}
	enable_irq(UART_INTERRUP_NR); //enable interrupts again.
}

//read from uart, hex version
static void ReadFromUartHex() {
	char hex_char = ReadUartChar(); //read the character
	if (message_complete == 0) { //we do not have a complete message
		if (hex_char == 'S' && receiving == 0) {
			uart_hex_buffer[uart_hex_buffer_index] = hex_char; //start of message so we start storing.
			//increment index.
			uart_hex_buffer_index++;
		} else if (receiving == 1) {
			uart_hex_buffer[uart_hex_buffer_index] = hex_char; //store hex chars from the middle of the message.

			if (uart_hex_buffer_index == 3) { //if were at the third index we have recieved the byte pair and can deciede the length
				char hex_num[2] = { 0 };
				hex_num[0] = uart_hex_buffer[2];
				hex_num[1] = uart_hex_buffer[3];
				msg_length = strtol(hex_num, NULL, 16); //convert the hex chars to integer.
			}
			if (uart_hex_buffer_index == msg_length) { //when the index is the same as the length we have recieved the whole msg.
				if (CheckMessageContentHex()) { //checking that message content is okay.
					message_complete = 1;
				} else {
					ResetPcConnectionParameters(); //Reset if invalid.
				}
			} //end of buffer = index if
		} // end of hex_char = 'S' if
	}// end of message_complete if
}

//help function to convert from hex chars to integer. takes four hex chars since 16 bits is contained in that.
static int HexToInt(char hexes[4]) {
	int HexInt = strtol(hexes, NULL, 16);
	return HexInt;
}

//send the recieved message back.
static void SendCharBufferHex() {
	int hex_buffer_index = 0;
	int not_finished = 1;

	while (not_finished) {
		int uart_status = UartSendStatus(); //get the status of the uart
		if (uart_status == 2) {
			SendCharOnUart(uart_hex_buffer[hex_buffer_index]); //send a char on the uart
			hex_buffer_index++; //increment the index
		}
		if (hex_buffer_index >= msg_length) { //if the whole message has been sent we finish.
			not_finished = 0;
		}
	} //enf of while
}

static void ResetPcConnectionParametersHex() {
	message_complete = 0;
	msg_length = 8; //minimum message length was 8.
	uart_hex_buffer_index = 0;
	receiving = 0; //not receiving a message anymore
	for (i = 0; i < MAX_MSG_SIZE; i++) { //reset all elements in the array
		uart_hex_buffer[i] = 0;
	}
}

//help function to check the content of the message. This one is for when we use hex messages.
static int CheckMessageContentHex() {
	int valid_content = 1; //content is set as valid initially
	if (uart_hex_buffer[0] == 'S' && uart_hex_buffer[msg_length]
			== MSG_TERMINATOR) { //check the first and last char of the message
		//check the rest of the message content is with valid chars.
		for (i = 1; i < msg_length - 1; i++) { //-1 on the msg_length since we do not want to include the terminator in the check.
			char tmp_hex = uart_hex_buffer[i];
			if (!(('0' <= tmp_hex && tmp_hex <= '9') || ('a' <= tmp_hex
					&& tmp_hex <= 'f') || ('A' <= tmp_hex && tmp_hex <= 'F'))) { //all these comparisons....
				valid_content = 0;
			}
		}
		return valid_content; //return the valid_content
	} else {
		return 0; //if either the first or last char were invalid we return 0.
	} //end of first if stmt.
}

//help function for verifying the checksum of message. Hex version
static int VerifyChecksumHex() {
	int computed_checksum = 0;
	char hex_pair[2];
	for (i = 2; i < msg_length - 3; i += 2) { //go through the message. -3 to exclude checksum pair and terminator.
		hex_pair[0] = uart_hex_buffer[i]; //read two chars
		hex_pair[1] = uart_hex_buffer[i + 1];
		int hex_number;
		computed_checksum += hex_number;
	}

	computed_checksum = ~computed_checksum; //do one's complement on the checksum
	computed_checksum = computed_checksum & 0xFF; //and with the lowest byte to remove the higher bits.

	hex_pair[0] = uart_hex_buffer[msg_length - 3]; //need to verify these indexes
	hex_pair[1] = uart_hex_buffer[msg_length - 2];
	int received_checksum = strtol(hex_pair, NULL, 16);

	if (received_checksum == computed_checksum) {
		return 1; //checksum is correct
	} else {
		return 0; //invalid checksum
	}
}

//----------------------------------------------------------------------------

//message_complete is set.
static int CheckIsMessageComplete() {
	return message_complete;
}

//reads the message type and returns it.
int GetMessageType() {
	//read the type of message and return it as integer.
	//int msg_type;
	return uart_char_buffer[1] - '0';
	//check if the char is in the valid range of 0 to 9.
	/*if (msg_char >= '0' && msg_char <= '9') {
	 //if it is in the valid range we assign it to an int by subtracting '0'.
	 msg_type = msg_char - '0';
	 } else {
	 //if it was not in the valid range then the message type does not exist.
	 //The message should not be parsed so a error value is used.
	 msg_type = -1;
	 } this check is redundant */

	//return the message type
	//return msg_type;
}
//--------------------------------------------------------------

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
	//disable interrupts for uart.
	disable_irq(UART_INTERRUP_NR);
	//check the status of the uart.
	//int status = UartReadStatus();
	if (UartReadStatus()) { //DR is high and the send register.
		//Data Ready (DR), retrieve data.
		ReadFromUart();
		//if the message is complete and handle it.
		if (CheckIsMessageComplete()) {
			// check the that the checksum is correct.
			if (VerifyChecksum()) {
				//The message had content & checksum. read it & handle it.
				//Get the type of message
				int msg_type = GetMessageType();
				//switch case used to decide what to do.
				switch (msg_type) {
				case 0:
					//set value in a filter
					sending = 1; 	//set sending high
					SendAChar();
					//SendCharBuffer(); //print to see it worked.
					break;
				default:
					; //if we enter here the message was undefined.
				} //end of switch
				//message has been handled. reset
				//ResetPcConnectionParameters();  //---------------------might need to remove this one with the new sending scheme.
			} else {
				//the checksum was incorrect reset and wait for a new message.
				//SendCharBuffer();
				//ResetPcConnectionParameters();
			} //end of checksum if.
		} //end of messagecomplete if.
	} else if(UartSendStatus()){ //if we can send and are sending we enter.
		//call to send a char and exit.
		if(sending){
			SendAChar();
		}
	}

	//enable interrupts again.
	enable_irq(UART_INTERRUP_NR);
}

//function used to send transmitt messages.
void SendAChar(){
	SendCharOnUart(uart_char_buffer[send_index]); //send a char
	send_index++; //increment the index.

	if (send_index == MSG_SIZE){ //check if the whole message is sent
		sending = 0; //finished sending.
		ResetPcConnectionParameters();
	}
}

//This function will send the received message
void SendCharBuffer() {
	//send the buffer to the uart write function to be printed.
	int buffer_index = 0;
	int not_finished = 1;
	//loop until the buffer is sent.
	while (not_finished) {
		//retrieve the uart status.
		int uart_status = UartSendStatus();
		if (uart_status == 2) { //3 == DR is high and transfer register is empty.
			//we can send a char.
			SendCharOnUart(uart_char_buffer[buffer_index]);
			//increment the index
			buffer_index++;
		} //end of uart status.
		if (buffer_index >= MSG_SIZE) {
			not_finished = 0;
		}
	} //end of while.
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
	} //end of message_complete if.
}

//All variables are reset.
static void ResetPcConnectionParameters() {
	//message_complete reseted
	message_complete = 0;
	//uart buffer index reseted
	uart_char_buffer_index = 0;
	//receiving is set to 0 so we can receive a new message.
	receiving = 0;

	sending = 0;
	send_index = 0;

	//set the buffer to !, because i want
	for (i = 0; i < MSG_SIZE; i++) {
		uart_char_buffer[i] = 0;
	}
}

//help function used to verify that there are no illegal
//letters or characters.
int CheckMessageContent() {
	int valid_content = 1;
	//check it the first char is 'S' and last is a terminator '\0'
	if (uart_char_buffer[0] == 'S' && uart_char_buffer[MSG_SIZE - 1]
			== MSG_TERMINATOR) {
		//if the first letter and last char is valid the rest of the message is checked that it contains digits only.
		for (i = 1; i < MSG_SIZE - 1; i++) {
			//check one char on each loop iteration and check that theyre in valid range.
			if ((uart_char_buffer[i] < '0') || (uart_char_buffer[i] > '9')) {
				//if this if statement is entered then atleast on letter is invalid.
				valid_content = 0;
			}
		} //end of for
		// end of first letter if check.
		//return the result
		return valid_content;
	} else {
		return 0; //return 0 if one of the starting letters were incorrect.
	}
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
	digit_pair[0] = uart_char_buffer[MSG_SIZE - 3];
	digit_pair[1] = uart_char_buffer[MSG_SIZE - 2];
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

