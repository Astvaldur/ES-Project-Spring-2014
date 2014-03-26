#include "datatypes.h"

circ_buff_t cb;


void cb_put(int16 indata)
{
	if ( cb.pos < 44100)
	{
		cb.pos++;
	} else
	{
		cb.pos = 0;
	}
	cb.elems[cb.pos] = indata;
}

int16 cb_get(int pos)
{
	if (pos < 0)
	{
		pos = 44100 + pos;
	}

	return cb.elems[pos];
}
