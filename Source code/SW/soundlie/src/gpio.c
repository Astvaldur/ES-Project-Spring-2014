#include "main.h"

//************************************************//
//Define GPIO structures
#define GPIO_ADDRESS 0x4000E000
struct GPIO
{
volatile int Input;
volatile int Output;
};

struct GPIO* gpio = (struct GPIO*) GPIO_ADDRESS;
//************************************************//
//Variables
int Delay,i,j = 0;
char Letter = '0';
char* Test_vector;
//Functions
int* Mask_Register = (int*)0x80000240;
int* Data_Register = (int*)0x80000100;
int* Pending_vector = (int*)Interrupts_Pending;
short Test_filter_input = 40000;
short test_buffer[4];
int32 Test_filter_output_Lowpass;
int32 Test_filter_output_BandPass;
int32 Test_filter_output_Highpass;
int Output_packet;
