//Include Libraries
#include "main.h"

//void Configuration();

int main()
 { 
    //Initiate start configurations for processor
    //Init_Config(); // Init main characteristics
    //Init_UART();   // Init UART characteristics
    //Init_Interrupts(); //Init interrupt characteristics

    //Enable interrupt for External interrupt
    catch_interrupt(irqhandler, 10);
    enable_irq(10);

    //Enable interrupt for PC connection
    // catch_interrupt(Configuration, 2);
    // enable_irq(2);

    puts("Ready to rock!");

    cb.pos = 0;

    //Infinite loop
    while(1);
 }

/*void Configuration()
{
			//Receive and print byte
		 	Letter = apbuart_Receive((int*)0x80000103);
		 	//apbuart_Send((int*)0x80000103);

			  if (Letter == 'y')
			  {
				  //apbuart_Send("Configuration of Bass,Middle and Treble begins:\n");
				  printf("Configuration of Bass,Middle and Treble begins: \n");
				  Letter = '<';
				  Config_Interrupts();
			  }

			  if (Letter == 'e')
			  {
				  //apbuart_Send("Executing current configuration:");
				  printf("Executing current configuration: \n");
				  Letter = '<';
				  //Test_filter_input = Test_filter_input + 10000;
				  *Pending_vector |= 0x400;
				  //force_irq(10);
			  }
}
*/

