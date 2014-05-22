/**
* @file uart.h
* @brief UART header file to access the APBUART
* @details Gives access to functions to configure and control the UART.
* Here the interrupt number can be configured.
* @author David Alm
* @version 1.0
*/

#ifndef _APBUART_H
#define _APBUART_H

#define UART_INTERRUP_NR 2
///< The UARTS interrupt, change this depending on what interrupt it uses.

//Function Prototypes
void InitUart();
char ReadUartChar();
void SendCharOnUart(char char_to_send);
int UartReadStatus();
int UartSendStatus();
int UartCheckOverrunAndFraming();
void UartClearStatusBits();

#endif
