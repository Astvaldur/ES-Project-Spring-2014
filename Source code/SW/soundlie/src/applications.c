//Include Libraries
#include "applications.h"
#include "main.h"
#include "uart.h"


//Functions


#define ICLEAR 0x20c
#define IMASK  0x240
#define IFORCE 0x208

struct uart_regs
{
   volatile int data;
   volatile int status;
   volatile int control;
   volatile int scaler;
};

struct interrupt_regs
{
	volatile int level;
	volatile int pending;
	volatile int force;
	volatile int clear;
	volatile int multi_status;
	volatile int broadcast;
	volatile int Reserved;
	volatile int watchdog_cntl;
	volatile int asym_mult_cntl_reg;
	volatile int interrupt_cntl_slc_reg_0_7;
	volatile int interrupt_cntl_slc_reg_8_15;
};

void Init_Interrupts()
{
  struct interrupt_regs *interrupt = (struct interrupt_regs *) INTERRUPT_START_REGISTER;

  interrupt -> level = 0;
  interrupt -> pending = 0;
  interrupt -> force= 0;
  interrupt -> clear = 0;
  interrupt -> multi_status =0;
  interrupt -> broadcast = 0;
  interrupt -> watchdog_cntl= 0;
  interrupt -> asym_mult_cntl_reg= 0;
  interrupt -> interrupt_cntl_slc_reg_0_7 = 0;
  interrupt -> interrupt_cntl_slc_reg_8_15 = 0;

}

char apbuart_Receive(char Packet[8])
{
	//apbuart_Send((int*)0x80000103);
	return Packet[0];
}

void apbuart_Send(char Packet[8])
{
	//Init Send variables
	//int SendCount,PacketCount = 0, Delay,g = 0;
	int SendCount, Delay;
	struct uart_regs *uart = (struct uart_regs *) UART_BASE_ADDRESS;

	//Send 8 Bytes each time
	 for(SendCount = 0; SendCount<8;SendCount++)
	 {
	 //Use delay between packets
	 for(Delay = 0; Delay<10000;Delay++);

	 if (Packet[SendCount] != '0')
	 {
		 uart->data = Packet[SendCount];
	 }

	 //printf("WTF");
	 //enable_irq(10);
	 //uart->data = Packet[SendCount];
	}

}

void Init_UART()
{
	    struct uart_regs *uart = (struct uart_regs *) UART_BASE_ADDRESS;
		//Set Start adress to UART base adress
		/* Config_Pointer = (char*)UART_BASE_ADDRESS;
		 Config_Pointer = (char*)((int)UART_BASE_ADDRESS +  (int)CONTROL_REGISTER);  // Set config pointer to Control registers adress.
		*Config_Pointer = 0x07;*/
		uart->control = 0;
        uart->data = 0;
        uart->scaler = 650; // To get 9600 baudrate
        uart->control = 0x07; //ENABLE_TX | 0x80000000 | 0x4000 | ENABLE_RX;
}

void Init_Config()
	{
	//*READY_TO_READ = 0;
	// Set start values for main execution here.
	}

void filter()
	{

	}
	
void Config_Interrupts()
{
	//struct interrupt_regs *interrupt = (struct interrupt_regs *) INTERRUPT_START_REGISTER;
}

