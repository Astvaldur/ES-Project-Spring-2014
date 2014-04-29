#ifndef _APBUART_H
#define _APBUART_H



extern int putChar(char c);
extern int putStr(const char *str);
extern int putInt(int a);

#define SIM 2
#define SYN 1
#define UART_BASE_ADDRESS (int*)0x80000100


//Write registers
#define DATA_REGISTER 			0x0
#define STATUS_REGISTER 		0x04
#define CONTROL_REGISTER 		0x08
#define SCALER_REGISTER	 		0x0C
#define TIMER_RELOAD_REGISTER 	0x10  //Wont need probably

#define DISABLE 0x0
#define ENABLE_RX 0x1
#define ENABLE_TX 0x2
#define RX_INT 0x4
#define TX_INT 0x8
#define EVEN_PARITY 0x20
#define ODD_PARITY 0x30
#define LOOP_BACK 0x80
#define FLOW_CONTROL 0x40
#define FIFO_TX_INT 0x200
#define FIFO_RX_INT 0x400

//Interrupt Registers

#define INTERRUPT_START_REGISTER    0x80000200
#define AMCR 						0x80000220  //Set the number of accisble registers
#define INTERRUPT_MASK_REGISTER     0x80000240  //ProC 1 MAsk  = 1 ?
#define PROCESSOR1_FORCE_REGISTER   0x80000284  //Proc 1 Force register = 1?
#define INTERRUPT_CLEAR_REG			0x8000020C  //CLear pending interrupts.
#define INTERRUPT_FORCE_REG 		0x80000208  //General Force register
#define Interrupts_Pending 			0x80000204  //Check for Proc 1 interrupt.

#define Transmit_buffer_interrupt   0x04

//Function Prototypes
void InitUart();
char ReadUartChar();
void SendCharOnUart(char);
int UartReadStatus();
int UartSendStatus();

#endif
