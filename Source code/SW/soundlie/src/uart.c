/*
 * uart.c
 *
 *  Created on: Mar 28, 2014
 *      Author: David
 */

#include "irq.h"

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
	//bit0:receiver enable, bit1:transmitter enable, bit2:receiver interrupt enabled
	uart_reg_ptr->control_reg = 0x07;
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

//get the status of the uart. Is there data recieved? Can we send next char.
int UartStatus() {
	//read the status from the uart.
	int uart_status = uart_reg_ptr->status_reg;
	//mask out unwanted bit is the status. We want bit0 & bit1.
	uart_status = (uart_status & 0x3);
	return uart_status;
}
