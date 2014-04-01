/**
* @file datatypes.c
* @brief Associated functions for types.
* @details Functions for handling types.
* @author Tobias Hallberg
* @version 1.0
*/

#include "datatypes.h"

void circ_buff_put(circ_buff_t *circ_buff, int16 indata)
{
	if ( circ_buff->pos < CIRC_BUFF_SIZE)
	{
		circ_buff->pos++;
	} else
	{
		circ_buff->pos = 0;
	}
	circ_buff->elems[circ_buff->pos] = indata;
}

int16 circ_buff_get(circ_buff_t *circ_buff, int pos)
{
	if (pos < 0)
	{
		pos = CIRC_BUFF_SIZE + pos;
	}

	return circ_buff->elems[pos];
}
