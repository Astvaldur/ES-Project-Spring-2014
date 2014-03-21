/*
 ============================================================================
 Name        : NGProj.c
 Author      : 
 Version     :
 Copyright   : Your copyright notice
 Description : Test of code....
 ============================================================================
 */

#define ADC_APB  0x80000A00
#define PWM_APB  0x80000B00

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void pwm_write(int addr, int outdata);
int adc_read(int addr);

//void gpio_init(int addr);

int main(void) {

	puts("Ready to rock!"); /* prints to debugport */

	int i = 0;

	while(1) {

		int adc_in = adc_read(ADC_APB);

		//printf("Test %d", adc_read);

		pwm_write(PWM_APB, adc_in);
	}


	return EXIT_SUCCESS;
}
