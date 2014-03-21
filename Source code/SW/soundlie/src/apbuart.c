/*
 * apbuart.c
 *
 *  Created on: 19 feb 2014
 *      Author:
 */

//#include <stdio.h>

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

/*
 * uart[0] = data
 * uart[1] = status
 * uart[2] = control
 * uart[3] = scaler
 */


struct uart_regs
{
   volatile int data;
   volatile int status;
   volatile int control;
   volatile int scaler;
};

static char test[] = "abcdefghijkl\n";


void apbuart_test(int addr)
{
        struct uart_regs *uart = (struct uart_regs *) addr;

        /* set scaler to baud rate of 9600 */
        uart->scaler = 650; //(system_clock_freq)/(baud_rate * 8) - 1

        uart->status = 0;
        uart->control = 0;
        uart->control = ENABLE_TX;// | 0x80000000 | 0x4200;

        //uart->data = (int) '70';
        //while ((uart->status == 0)); //Wait until fifo is less than half full
        	        	//for(j = 0; j < 100000; j ++);
        //}

		//printf("UART status 0x%x\n", uart->status);



}
