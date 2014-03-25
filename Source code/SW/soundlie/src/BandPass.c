/**************************************************************
WinFilter version 0.8
http://www.winfilter.20m.com
akundert@hotmail.com

Filter type: Band Pass
Filter model: Chebyshev
Filter order: 2
Sampling Frequency: 48 KHz
Fc1 and Fc2 Frequencies: 0.350000 KHz and 2.400000 KHz
Pass band Ripple: 2.000000 dB
Coefficents Quantization: 16-bit

Z domain Zeros
z = -1.000000 + j 0.000000
z = -1.000000 + j 0.000000
z = 1.000000 + j 0.000000
z = 1.000000 + j 0.000000

Z domain Poles
z = 0.977976 + j -0.054504
z = 0.977976 + j 0.054504
z = 0.885061 + j -0.239658
z = 0.885061 + j 0.239658
***************************************************************/
#include "main.h"
#include "filters.h"

#define NCoef 4
#define DCgain 256



int16 iir_BP(int16 NewSample) {
	int16 ACoef[NCoef+1] = {
        14935,
            0,
        -29870,
            0,
        14935
    };

	int16 BCoef[NCoef+1] = {
         4096,
        -15262,
        21555,
        -13692,
         3304
    };

    static int32 y[18 + NCoef+1]; //output samples
    //Warning!!!!!! This variable should be signed (input sample width + Coefs width + 4 )-bit width to avoid saturation.

    static int16 x[NCoef+1]; //input samples
    int n;

    //shift the old samples
    for(n=NCoef; n>0; n--) {
       x[n] = x[n-1];
       y[n] = y[n-1];
    }

    //Calculate the new output
    x[0] = NewSample;
    y[0] = ACoef[0] * x[0];
    for(n=1; n<=NCoef; n++)
        y[0] += ACoef[n] * x[n] - BCoef[n] * y[n];

    y[0] /= BCoef[0];
    
    return y[0] / DCgain;
}
