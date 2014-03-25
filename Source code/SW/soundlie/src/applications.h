/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __APPLICATIONS_H
#define __APPLICATIONS_H


#include "main.h"
#include "uart.h"


//Initiate functions
void filter(void);
void Init_Config(void);
void Init_UART(void);
void Init_Interrupts(void);
void Config_Interrupts(void);
//void irqhandler(int irq);

void apbuart_Send(char Packet[8]);
char apbuart_Receive(char Packet[8]);


//Variables
char* Config_Pointer;
int i;

//structs

#endif /* __APPLICATIONS_H */
