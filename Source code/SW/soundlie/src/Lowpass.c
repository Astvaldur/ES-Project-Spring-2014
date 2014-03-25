/**************************************************************
WinFilter version 0.8
http://www.winfilter.20m.com
akundert@hotmail.com

Filter type: Low Pass
Filter model: Chebyshev
Filter order: 2
Sampling Frequency: 48 KHz
Cut Frequency: 0.300000 KHz
Pass band Ripple: 2.000000 dB
Coefficents Quantization: 16-bit

Z domain Zeros
z = -1.000000 + j 0.000000
z = -1.000000 + j 0.000000

Z domain Poles
z = 0.983826 + j -0.030969
z = 0.983826 + j 0.030969
***************************************************************/
#include "main.h"
#include "filters.h"



#define NCoef 2
#define DCgain 2048

int16 iir_LP(int16 NewSample) {
	int16 ACoef[NCoef+1] = {
        10477,
        20955,
        10477
    };

	int16 BCoef[NCoef+1] = {
        16384,
        -32238,
        15874
    };

    static int32 y[18 + NCoef+1]; //output samples
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
