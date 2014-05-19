/*
 * pc_communication.c
 *
 *  Created on: Mar 24, 2014
 *      Author: David
 */

#include "pc_communication.h"

//turn of optimizing since this code breaks when optimizing.
#pragma GCC push_options
#pragma GCC optimize ("O0")

//help function prototypes
static bool VerifyChecksum();
static bool ReadFromUart();
static void ResetPcConnectionParameters();
static bool SendAChar();
static void MessageHandler();
static void ExtractFilterTaps();
static input_type_e GetMessageTypeEnum();
static int ExtractSelectedValue();
static bool checkChar(char);

//static void SendCharBuffer();

//char buffer set at the maximum msg size accepted
char uart_buffer[MAX_MSG_SIZE] = { 0 };
//integer to store the length of the received message. Minimum length is 13 which is a amplification message.
int msg_length = 13;
//buffer index
int uart_buffer_index = 0;
//index used when sending.
int send_index = 0;
//sending variable. used to determine if the current message is to be sent.
bool not_sending = true;
//receiving is used to signal if were recieving a message or not.
bool receiving = false;

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

//newer function to handle reading and handling the messages.
void PcConnectionHandler() {
	disable_irq(10);
	disable_irq(UART_INTERRUP_NR); //Disable interrupts

	bool do_reset = false;

	if (UartCheckOverrunAndFraming()) {
		//if the uart is overrun then the message has to be resent.
		SendCharOnUart('E');  //signal that the message got Overrunned.
		UartClearStatusBits(); //clear the overrun bit.
		do_reset = true; //reset the connection for a new message.

	} else if (UartReadStatus() && not_sending) { //When the uartstatus == 1. then data ready (DR).
		//call on read from uart. Will return true if a reset should be done.
		do_reset = ReadFromUart();
		//recieve result from reading if the char was valid.

	} else if (UartSendStatus() && !not_sending) {
		//call to send a char
		do_reset = SendAChar();
	}

	//We reset when a message is received and we are not sending a message.
	if (do_reset && not_sending) {
		ResetPcConnectionParameters();
	}

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

		//extract taps and assign them to the struct
		int16_t new_x_coefficients[IIR_MAX_COEFFS] = { 0 }; //x taps
		int16_t new_y_coefficients[IIR_MAX_COEFFS] = { 0 }; //y taps
		new_filter_data.x_data = new_x_coefficients;
		new_filter_data.y_data = new_y_coefficients;
		ExtractFilterTaps(new_x_coefficients, new_y_coefficients);

		tc_set_filter_coeff(&new_filter_data); //calling the filter config function.
		SendCharOnUart('F'); //send F on succesful configuration.
		break;
	}
	case SET_BASS: { //set new new value on bass amplification
		tc_ctrl_data_t current_amp = tc_get_amp();
		current_amp.lp_amp = ExtractSelectedValue(0);
		tc_set_amp(&current_amp); //set the new configuration
		SendCharOnUart('B');
		break;
	}
	case SET_MIDDLE: {  //set new value on middle amplification
		tc_ctrl_data_t current_amp = tc_get_amp();
		current_amp.bp_amp = ExtractSelectedValue(0);
		tc_set_amp(&current_amp); //set the new configuration
		SendCharOnUart('M');
		break;
	}
	case SET_TREBLE: {  //set new value on treble amplifications
		tc_ctrl_data_t current_amp = tc_get_amp();
		current_amp.hp_amp = ExtractSelectedValue(0); //set the new treble amplitude
		tc_set_amp(&current_amp); //set the new configuration
		SendCharOnUart('T');
		break;
	}
	case SET_ECHO: {  //set the echo functions.
		echo_input_data_t new_echo = echo_get(); //get the current echo settings.
		new_echo.delay = ExtractSelectedValue(0); //extract the new delay and set value in struct.
		new_echo.dry_amp = ExtractSelectedValue(1); //dry amp value
		new_echo.wet_amp = ExtractSelectedValue(2); //wet amp value

		bool success = echo_set(&new_echo); //set the new echo
		if (success) {
			SendCharOnUart('O');
		}
		break;
	}
	default:
		break;
	}
}

//read the the amplification value from the message and return it.
static int ExtractSelectedValue(int offset) {
	int value_offset = 4 * offset;	//
	char value_chars[4] = { 0 }; //array to store chars that represent the value
	value_chars[0] = uart_buffer[6 + value_offset];
	value_chars[1] = uart_buffer[7 + value_offset];
	value_chars[2] = uart_buffer[8 + value_offset];
	value_chars[3] = uart_buffer[9 + value_offset];
	int extracted_value = strtol(value_chars, NULL, 16); //convert the value to integer.
	return extracted_value;
}

static void ExtractFilterTaps(int16_t *x_pointer, int16_t *y_pointer) {

	int i = 0;
	int taps = (msg_length - 9) / 8; //number of taps

	for (i = 0; i <= taps / 2; i++) {
		int x_tap_value = ExtractSelectedValue(i);
		*x_pointer = x_tap_value;
		x_pointer++;

	}

	for (i = taps; i < taps * 2; i++) {
		int y_tap_value = ExtractSelectedValue(i);
		*y_pointer = y_tap_value;
		y_pointer++;

	}
}

static input_type_e GetMessageTypeEnum() {
	int message_integer = uart_buffer[1] - '0'; //get the number from the array
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
	case 3:
		message_enum = SET_BASS;
		break;
	case 4:
		message_enum = SET_MIDDLE;
		break;
	case 5:
		message_enum = SET_TREBLE;
		break;
	case 8:
		message_enum = SET_ECHO;
	}
	return message_enum;
}


//how function to send a char.
static bool SendAChar() {
	SendCharOnUart(uart_buffer[send_index]);
	send_index++;

	if (send_index == msg_length) { //when the whole message is sent then we stop
		not_sending = true; //setting not sending to true.
		return true;		//return true for reset.
	} else {
		return false;
	}
}

//read from uart, hex version
static bool ReadFromUart() {
	char hex_char = ReadUartChar(); //read the character
	bool valid_char = checkChar(hex_char);

	bool read_reset = false;    //set to true if a regular reset should be done.
	bool do_error_reset = true; //if noone of the valid cases are executed its a error.

	switch (hex_char) {
	case 'S': {
		if (!receiving) {
			uart_buffer[uart_buffer_index] = hex_char; //start of message so we start storing.
			//increment index.
			uart_buffer_index++;
			//receiving is set
			receiving = true;
			//SendCharOnUart('!');
			do_error_reset = false; //valid message so no error reset.
		}
		break;
	}
	case MSG_TERMINATOR: {
		if (uart_buffer_index == (msg_length - 1) && receiving) {
			uart_buffer[uart_buffer_index] = hex_char;

			if (VerifyChecksum()) {
				MessageHandler();
				do_error_reset = false; //valid message so no error reset.
			}
		}
		read_reset = true;
		break;
	}
	default: {
		if (valid_char && receiving) {
			uart_buffer[uart_buffer_index] = hex_char; //store hex chars from the middle of the message.
			uart_buffer_index++; //increment index

			do_error_reset = false; //no error reset

			//SendCharOnUart('.');
			if (uart_buffer_index == 4) {
				char *hex_num = (char*) calloc(2, sizeof(char));
				hex_num[0] = uart_buffer[2];
				hex_num[1] = uart_buffer[3];
				msg_length = strtol(hex_num, NULL, 16); //convert the hex chars to integer.
				//printf(" %d", msg_length);
				msg_length += 4; //include the type and byte count elements in the length
				//printf(" %d", msg_length);
				free(hex_num);
			}
		}
		break;
	}
	}
	if (do_error_reset){
		SendCharOnUart('E');
	}
	//boolean return if a reset should be performed.
	return (read_reset || do_error_reset);
}

//function to check that a char is valid.
static bool checkChar(char hexChar) {
	if (!(('0' <= hexChar && hexChar <= '9')
			|| ('a' <= hexChar && hexChar <= 'f')
			|| ('A' <= hexChar && hexChar <= 'F'))) { //all these comparisons....
		return false; //invalid char
	} else {
		return true; //valid char
	}
}

static void ResetPcConnectionParameters() {
	msg_length = 13; //minimum message length was 8.
	uart_buffer_index = 0;
	receiving = false; //not receiving a message anymore
	not_sending = true; //not not_sending characters anymore.
	send_index = 0; //reset send index.

	int i;
	for (i = 0; i < MAX_MSG_SIZE; i++) { //reset all elements in the array
		uart_buffer[i] = 0;
	}
}

//help function for verifying the checksum of message. Hex version
static bool VerifyChecksum() {
	int computed_checksum = 0;
	char hex_pair[2];

	int i;
	for (i = 2; i < msg_length - 3; i += 2) { //go through the message. -3 to exclude checksum pair and terminator.
		hex_pair[0] = uart_buffer[i]; //read two chars
		hex_pair[1] = uart_buffer[i + 1];
		int hex_number = strtol(hex_pair, NULL, 16);
		computed_checksum += hex_number;
	}

	computed_checksum = ~computed_checksum & 0xFF; //one's complement on the checksum and AND it to get the lowers byte.

	hex_pair[0] = uart_buffer[msg_length - 3]; //  Retrieve the checksum sent with the message.
	hex_pair[1] = uart_buffer[msg_length - 2];
	int received_checksum = strtol(hex_pair, NULL, 16);

	if (received_checksum == computed_checksum) {
		return true; //checksum is correct
	} else {
		return false; //invalid checksum
	}
}
