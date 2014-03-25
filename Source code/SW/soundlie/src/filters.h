/*
 * filters.h
 *
 *  Created on: 24 mar 2014
 *      Author: Viccy
 */

#ifndef FILTERS_H_
#define FILTERS_H_

typedef int int16;
typedef int int32;

int16 iir_LP(int16 NewSample);
int16 iir_BP(int16 NewSample);
int16 iir_HP(int16 NewSample);





#endif /* FILTERS_H_ */
