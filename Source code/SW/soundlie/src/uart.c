/*
 * uart.c
 *
 *  Created on: Mar 28, 2014
 *      Author: David
 */

#include "uart.h"

//struct to be used to access the registers of the uart.
struct uartregisters {
	volatile int data_reg;
	volatile int status_reg;
	volatile int control_reg;
	volatile int scaler_reg;
};

//create a pointer to the UART registers. Making the pointer of type uartregsisters
struct uartregisters *uart_reg_ptr = (struct uartregisters *) UART_BASE_ADDRESS;

//initialize the uart to be able to communicate with the pc.
void InitUart() {
	//set scaler to 9600 baudrate.
	uart_reg_ptr->scaler_reg = 650; //28A in hex.
	//set the correct control bits.
	//bit0:receiver enable, bit1:transmitter enable, bit2:receiver interrupt enabled, bit3: transmitt interuppt enabled.
	uart_reg_ptr->control_reg = 0x0F;
	//clear the uart status reg.
	uart_reg_ptr->status_reg = 0;
}

//function to read from uart.
char ReadUartChar() {
	//read the data register
	int data_reg = uart_reg_ptr->data_reg;
	//Put the int into a char. The higher bits are of no value.
	char uart_char = data_reg;
	//return the char.
	return uart_char;
}

//sends message over uart.
void SendCharOnUart(char char_to_send) {
	//put the char in the holding register. (data register)
	uart_reg_ptr->data_reg = char_to_send;
}

//status check to se if sending is possible
int UartSendStatus(){
	int send_status = uart_reg_ptr->status_reg; //get the status of the uart
	send_status = (send_status & 0x2) >> 1;  //bitwise AND then shift the status bit to LSB.
	return send_status;
}

//status check to see if reading is possible
int UartReadStatus(){
	int read_status = uart_reg_ptr->status_reg; //read status of the uart.
	return (read_status & 0x1);
}

//Checks the desired error bits of the uart.
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

//Writes 0 to a specific bit in the uart status registry.
void UartClearStatusBits(){
	uart_reg_ptr->status_reg = 0; //write zero to status register
}
/*get the status of the uart. Is there data recieved? Can we send next char. redundant
int UartStatus() {
	//read the status from the uart.
	int uart_status = uart_reg_ptr->status_reg;
	//mask out unwanted bit is the status. We want bit0 & bit1.
	uart_status = (uart_status & 0x3);
	return uart_status;
}*/
