/* Use this file as an example for how to write test C code
   for testing your AHB slave modules in simulator */

//Address of adder is 0xFFF50000 (hindex=4, haddr=8)

#include "uart.h"

int main(void)
{

int i;
/* For simulation, print using putStr() function,
   this is a very basic function and will only print pure strings.
   Always end your string with \r which is required
   as a handshake signal */
putStr("Test Started\n\r");

/* Write A */
*(volatile int*)(0xFFF50000) = 10;

/* Write B */
*(volatile int*)(0xFFF50004) = 20;

/* This is a hack since it takes two cycles to get
   the result */
i = *(volatile int*)(0xFFF50008);
i = *(volatile int*)(0xFFF50008);

putStr("Addition result:\n\r");

/* Use putInt() to print integers */
putInt(i);
putStr("Test Finished\n\r");

return 0;

}
