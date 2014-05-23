// ConsoleApplication1.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <math.h>
#include <stdio.h>

typedef char Byte;
typedef signed short int_16;
typedef signed long int_32;

typedef union{
	struct{
		int_16 lsb;
		int_16 msb;
	};
	int_32 full;
}int_32split;

void printBinary_16(int_16);
void printBinary_32(int_32);
int_32 multiply2(int_16 a, int_16 b);
int_16 frac2int(float f);
float int2frac(int_16 x);

//int _tmain(int argc, _TCHAR* argv[])
//{
//	float f1 = 0.5;
//	float f2 = -0.25;
//
//	int_16 i1 = frac2int(f1);
//	printBinary_16(i1);
//	int_16 i2 = frac2int(f2);
//	printBinary_16(i2);
//	int_32split r1;
//	
//	r1.full = multiply2(i1, i2);
//	printf("%f\n", int2frac(r1.msb));
//	r1.full = multiply2(-i1, i2);
//	printf("%f\n", int2frac(r1.msb));
//	r1.full = multiply2(i1, -i2);
//	printf("%f\n", int2frac(r1.msb));
//	r1.full = multiply2(-i1, -i2);
//	printf("%f\n", int2frac(r1.msb));
//	printBinary_16(r1.msb);
//	getchar();	
//	return 0;
//}

int_32 multiply2(int_16 a, int_16 b){
	return ((int_32)a * b) << 1;
}

int_16 frac2int(float f){
	int_16 result = 0;
	float t_f = abs(f);
	int i;

	for(i = (sizeof(int_16)*8)-1 ; i >= 0 ; i--){
		if(t_f >= pow(2.0, -(16-i))){
			result |= (1<<i-1);
			t_f -= pow(2.0, -(16-i));
		}
	}
	if(f<0){
		result = ~result;
	}
	return result;
}

float int2frac(int_16 x){
	float result= 0;
	int i;
	int_16 t_x;
	

	if(x < 0){
		t_x = ~x;
	}else{
		t_x = x;
	}
	for(i = (sizeof(int_16)*8)-1 ; i >= 0 ; i--){
		if(t_x & (1<<i)){
			result += pow(2.0, -(15-i));
		}
	}
	if(x < 0){
		result = -1*result;
	}
	return result;
}

void printBinary_16(int_16 val){
	int i;
	printf("Input value: %d\t Binary value: ", val);
	for(i = (sizeof(val)*8)-1 ; i >= 0 ; i--){
		if(val & (1<<i)){
			printf("1");
		}else{
			printf("0");
		}
	}
	printf("\n");
}

void printBinary_32(int_32 val){
	int i;
	printf("Input value: %ld\t Binary value: ", val);
	for(i = (sizeof(val)*8)-1 ; i >= 0 ; i--){
		if(val & (1<<i)){
			printf("1");
		}else{
			printf("0");
		}
	}
	printf("\n");
}
