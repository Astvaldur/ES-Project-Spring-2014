/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef DATATYPES_H_
#define DATATYPES_H_


typedef int int16;
typedef int int32;

typedef struct {
    int         start;  /* index of oldest element              */
    int         end;    /* index at which to write new element  */
    int			pos;
    int16		elems[44100];  /* vector of elements            */
} circ_buff_t;


#endif /* DATATYPES_H_ */
