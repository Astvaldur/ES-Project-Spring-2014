/**************************************************************
WinFilter version 0.8
http://www.winfilter.20m.com
akundert@hotmail.com

Filter type: High Pass
Filter model: Chebyshev
Filter order: 2
Sampling Frequency: 48 KHz
Cut Frequency: 4.800000 KHz
Pass band Ripple: 2.000000 dB
Coefficents Quantization: 16-bit

Z domain Zeros
z = 1.000000 + j 0.000000
z = 1.000000 + j 0.000000

Z domain Poles
z = 0.677338 + j -0.392048
z = 0.677338 + j 0.392048
***************************************************************/
#include "main.h"
#include "filters.h"


#define NCoef 2
#define DCgain 1

int16 iir_HP(int16 NewSample) {
	int16 ACoef[NCoef+1] = {
        12155,
        -24310,
        12155
    };

	int16 BCoef[NCoef+1] = {
        16384,
        -22195,
        10035
    };

    static int32 y[16+NCoef+1+2]; //output samples
    //Warning!!!!!! This variable should be signed (input sample width + Coefs width + 2 )-bit width to avoid saturation.

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
