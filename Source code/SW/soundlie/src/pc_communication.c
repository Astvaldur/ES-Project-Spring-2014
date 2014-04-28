/*
 * pc_communication.c
 *
 *  Created on: Mar 24, 2014
 *      Author: David
 */

#include "pc_communication.h"

//help function prototypes
static int CheckMessageContentHex();
static int CheckIsMessageComplete();
static int VerifyChecksumHex();
static void ReadFromUartHex();
static void ResetPcConnectionParametersHex();
static void SendACharHex();
static void SendCharBufferHex();
static void MessageHandler();
static void ExtractFilterTaps();
static input_type_e GetMessageTypeEnum();

//char buffer set at the maximum msg size accepted
char uart_hex_buffer[MAX_MSG_SIZE] = { 0 };
//integer to store the length of the received message. Minimum length is 8
int msg_length = 8;
//buffer index
int uart_hex_buffer_index = 0;
//index used when sending.
int send_index = 0;
//sending variable. used to determine if the current message is to be sent.
int sending = 0;
//message_complete is used to alter between receiving and reading the message.
int message_complete = 0;
//receiving is used to signal if were recieving a message or not.
int receiving = 0;

void PcConnectionInitHex() {
	//make sure everything is reset.
	ResetPcConnectionParametersHex();
	//call on InitUart
	InitUart();
	//bind which function should be called when interrupt occurs on uart.
	catch_interrupt(PcConnectionHandlerHex, UART_INTERRUP_NR);
	//enable interrupts for uart in the system.
	enable_irq(UART_INTERRUP_NR);
}

//newer function to handle reading and handling the messages.
void PcConnectionHandlerHex() {
	disable_irq(10);
	disable_irq(UART_INTERRUP_NR); //Disable interrupts
	disable_irq(10);
	if (UartReadStatus()) { //When the uartstatus == 1. then data ready (DR).
		ReadFromUartHex();

		if (CheckIsMessageComplete()) {
			if (VerifyChecksumHex()) { //Verify that checksum is valid
				//call the messagehandler
				MessageHandler();
				//SendCharOnUart('Y');

				ResetPcConnectionParametersHex(); //reset variables when all has been handled.
			} else {
				//SendCharBufferHex();
				ResetPcConnectionParametersHex(); //reset if something was invalid in the message.
			} //end of checkmessage/verifychecksum if.

		}// end of message complete
	} else if (UartSendStatus() && sending) { //&& logical AND
		//call to send a char
		SendACharHex();
	}
	enable_irq(10);
	enable_irq(UART_INTERRUP_NR); //enable interrupts.
	enable_irq(10);
}

//this function handles the operation of the message. Does what is specified in the message.
static void MessageHandler() {
	input_type_e msg_type = GetMessageTypeEnum(); //get the message type.

	switch (msg_type) {
	case FILTER_HP:
	case FILTER_MID:
	case FILTER_LP: {

		iir_input_data_t new_filter_data; //declare struct to store the data in.
		//calculate the number of taps in the message. data field length/2/4 => datafield/8. each tap takes 4 ascii so thats why division of 4 is present.

		new_filter_data.type = msg_type;
		new_filter_data.taps = (msg_length - 9) / 8;

		int16_t new_x_coefficients[IIR_MAX_COEFFS] = { 0 }; //x taps
		new_filter_data.x_data = new_x_coefficients; //assign the array to the struct array

		int16_t new_y_coefficients[IIR_MAX_COEFFS] = { 0 }; //y taps
		new_filter_data.y_data = new_y_coefficients; //assign array to struct array.

		ExtractFilterTaps(new_x_coefficients, new_y_coefficients);

		//printf("%d", new_filter_data.y_data[0]); //to verify i have the correct ints.

		bool result = tc_set_filter_coeff(&new_filter_data); //calling the filter config function.

		if (result){
			SendCharOnUart('!'); //send ! on succesful configuration.
		} else {
			SendCharOnUart('?');
		}

		//SendCharOnUart('$');
		//function here to handle filter taps
		//call on the function to configure filters

	}
		break;
	case 3:
		break;
	case 5:
		break;
	case 7:
	case 8:
	case 9:
		//function here to handle setting values of the bass, mid and treble.
		break;
	default:
		break;
	}
}

static void ExtractFilterTaps(int16_t *x_pointer, int16_t *y_pointer) {
	int data_index_border = (msg_length - 9) / 2; //calculate where in the datafield the y data begins
	data_index_border += 6;
	//printf("Border: %d ", data_index_border);

	char hex_number[4] = { 0 }; //array to temporary store the hex number.
	//iterate through the first half of the data field and save the x values.
	for (i = 6; i < data_index_border; i += 4) {
		hex_number[0] = uart_hex_buffer[i]; //transfer the hex chars.
		hex_number[1] = uart_hex_buffer[i + 1];
		hex_number[2] = uart_hex_buffer[i + 2];
		hex_number[3] = uart_hex_buffer[i + 3];
		//convert the value to a integer and store it in the passed array.
		*x_pointer = strtol(hex_number, NULL, 16); //store the value in the array.
		x_pointer++; //increment the pointer.
	}

	//iterate through the second half of the array and save the y values.
	for (i = data_index_border; i < msg_length - 3; i += 4) {
		hex_number[0] = uart_hex_buffer[i]; //transfer the hex chars.
		hex_number[1] = uart_hex_buffer[i + 1];
		hex_number[2] = uart_hex_buffer[i + 2];
		hex_number[3] = uart_hex_buffer[i + 3];
		*y_pointer = strtol(hex_number, NULL, 16); //store value in array.
		y_pointer++;
	}
	//SendCharOnUart('T');
}

static input_type_e GetMessageTypeEnum() {
	int message_integer = uart_hex_buffer[1] - '0'; //get the number from the array
	input_type_e message_enum;
	switch (message_integer) {
	case 0:
		message_enum = FILTER_LP;
		break;
	case 1:
		message_enum = FILTER_MID;
		break;
	case 2:
		message_enum = FILTER_HP;
		break;
	case 7:
	case 8:
	case 9:
		;
	}
	return message_enum;
}

//how function to send a char.
static void SendACharHex() {
	SendCharOnUart(uart_hex_buffer[send_index]);
	send_index++;

	if (send_index == msg_length) { //when the whole message is sent then we stop
		ResetPcConnectionParametersHex(); //reseting parameters since were done.
	}
}

//read from uart, hex version
static void ReadFromUartHex() {
	char hex_char = ReadUartChar(); //read the character
	//printf(".");
	if (message_complete == 0) { //we do not have a complete message
		if (hex_char == 'S' && receiving == 0) {
			uart_hex_buffer[uart_hex_buffer_index] = hex_char; //start of message so we start storing.
			//increment index.
			uart_hex_buffer_index++;
			//receiving is set
			receiving = 1;
		} else if (receiving == 1) {
			uart_hex_buffer[uart_hex_buffer_index] = hex_char; //store hex chars from the middle of the message.
			uart_hex_buffer_index++; //increment index

			if (uart_hex_buffer_index == 4) { //if were at the fourth index we have recieved the byte pair and can deciede the length
				char hex_num[2] = { 0 };
				hex_num[0] = uart_hex_buffer[2];
				hex_num[1] = uart_hex_buffer[3];
				msg_length = strtol(hex_num, NULL, 16); //convert the hex chars to integer.
				msg_length += 4; //include the type and byte count elements in the length
			}
			if (uart_hex_buffer_index >= msg_length) { //when the index is the same as the length we have recieved the whole msg.
				if (CheckMessageContentHex()) { //checking that message content is okay.
					message_complete = 1;
				} else {
					ResetPcConnectionParametersHex(); //Reset if invalid.
				}
			} //end of buffer = index if
		} // end of hex_char = 'S' .... if
	}// end of message_complete if
}

static void ResetPcConnectionParametersHex() {
	message_complete = 0; //message complete reset.
	msg_length = 8; //minimum message length was 8.
	uart_hex_buffer_index = 0;
	receiving = 0; //not receiving a message anymore
	sending = 0; //not sending characters anymore.
	send_index = 0; //reset send index.
	for (i = 0; i < MAX_MSG_SIZE; i++) { //reset all elements in the array
		uart_hex_buffer[i] = 0;
	}
}

//help function to check the content of the message. This one is for when we use hex messages.
static int CheckMessageContentHex() {
	int valid_content = 1; //content is set as valid initially
	if (uart_hex_buffer[0] == 'S' && uart_hex_buffer[msg_length - 1]
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
		int hex_number = strtol(hex_pair, NULL, 16);
		computed_checksum += hex_number;
	}

	computed_checksum = ~computed_checksum & 0xFF; //one's complement on the checksum and AND it to get the lowers byte.

	hex_pair[0] = uart_hex_buffer[msg_length - 3]; //  Retrieve the checksum sent with the message.
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

//--------------------------------------------------------------------------------- debug functions

//used for debugging to check that the message works. to use this disable sending interrupts. Will only work in simulator(TSIM)
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

/*read the characters from the data field in the message and convert to integer and return.
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
 }*/

