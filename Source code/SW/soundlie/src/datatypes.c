/**
 * @file datatypes.c
 * @brief Associated functions for types.
 * @details Functions for handling types related to circular buffers.
 * @author Tobias Hallberg
 * @version 1.0
 */

#include "datatypes.h"

/**
 * Put data into circular buffer
 * @param  [in]  circ_buff  The circular buffer that the data is to be put into.
 * @param  [in]  indata   	The data that will be put in the buffer
 * @return None
 */
void circ_buff_put(circ_buff_t *circ_buff, int16_t indata)
{
	if ( circ_buff->pos < CIRC_BUFF_SIZE - 1)
	{
		circ_buff->pos++;
	} else
	{
		circ_buff->pos = 0;
	}
	circ_buff->elems[circ_buff->pos] = indata;
}

/**
 * Fetches data from circular buffer
 * @param  [in]  circ_buff   The circular buffer that the data is to be read from
 * @param  [in]  circ_buff   The offset of the fetched data's position in relation to the latest added data's position
 * @return Requested data from buffer
 */
int16_t circ_buff_get(circ_buff_t *circ_buff, int32_t offset)
{
	int32_t pos = circ_buff->pos - offset;

	if (pos < 0)
	{
		pos = CIRC_BUFF_SIZE + pos;
	}

	return circ_buff->elems[pos];
}
