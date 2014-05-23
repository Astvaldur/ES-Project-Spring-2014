/**
* @file uart.c
* @brief Configuration and control functions for the APB UART.
* @details All functions related to the UART is contained in this file.
* Functions to configure, read & send, read & clear status register
* is available in this file.
* @author David Alm
* @version 1.0
*/

#include "uart.h"


#define UART_BASE_ADDRESS (int*)0x80000100
///< Pointer for the base memory address of the UART on the APB bus.

///< With this struct access to the UARTs register is achieved by creating a pointer
struct uartregisters {
	volatile int data_reg;
	volatile int status_reg;
	volatile int control_reg;
	volatile int scaler_reg;
};

///< Struct pointer that points to the base address of the UART.
struct uartregisters *uart_reg_ptr = (struct uartregisters *) UART_BASE_ADDRESS;


/**
* Function to initialize the UART. Sets the baud rate to 9600 baud,
* activates transmitter/receiver operation and enables interrupt generation.
*/
void InitUart() {
	//set scaler to 9600 baudrate.
	uart_reg_ptr->scaler_reg = 650; //28A in hex, 9600 baud
	//set the correct control bits.
	//bit0:receiver enable, bit1:transmitter enable, bit2:receiver interrupt enabled, bit3: transmitt interuppt enabled.
	uart_reg_ptr->control_reg = 0x0F;
	//clear the uart status reg.
	uart_reg_ptr->status_reg = 0;
}



/**
* Used to read data that the UARTs receiver has successfully received.
* @return Character read from UART.
*/
char ReadUartChar() {
	//read the data register
	int data_reg = uart_reg_ptr->data_reg;
	//Put the int into a char. The higher bits are of no value.
	char uart_char = data_reg;
	//return the char.
	return uart_char;
}


/**
* Function used to transmit data over the UART.
* @param [in] char_to_send Character to be sent.
*/
void SendCharOnUart(char char_to_send) {
	//put the char in the holding register. (data register)
	uart_reg_ptr->data_reg = char_to_send;
}


/**
* Reads the status registers and specifically checks if
* the transmitter is ready to send new data.
* @return The status of the specific status bit, its high or low.
*/
int UartSendStatus(){
	int send_status = uart_reg_ptr->status_reg; //get the status of the uart
	send_status = (send_status & 0x2) >> 1;  //bitwise AND then shift the status bit to LSB.
	return send_status;
}


/**
* Reads the status register and returns the specific status
* bit signaling if the receiver has received data that can
* be retrieved.
* @return Returns status of the receiver which is high or low.
*/
int UartReadStatus(){
	int read_status = uart_reg_ptr->status_reg; //read status of the uart.
	return (read_status & 0x1);
}



/**
* This is the description of the main function.
* It is the beginning of the program.
* You always need a main ive heard or it won't compile.
*
* Reads the error bits in the status register.
* Specifically checks the overrun error and framing error bits.
* @return Error status, either high or low.
*/
int UartCheckOverrunAndFraming(){
	int overrun_error = uart_reg_ptr->status_reg; //read the status of uart.
	int framing_error = uart_reg_ptr->status_reg;
	overrun_error = (overrun_error & 0x10) >> 4; //shift down the overrun flag
	framing_error = (framing_error & 0x40) >> 6;  //shift down framing flag
	if (framing_error == 1 || overrun_error == 1) {
		//if one of the flags have been raised return true.
		return 1;
	} else {
		return 0;
	}
}



/**
* Used to clear the status register of errors.
*/
void UartClearStatusBits(){
	uart_reg_ptr->status_reg = 0; //write zero to status register
}
