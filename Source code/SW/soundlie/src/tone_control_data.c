#include "tone_control.h"

fir_data_t tc_lp = {
		21,
		{
				239,
				307,
				503,
				810,
				1196,
				1625,
				2054,
				2441,
				2749,
				2946,
				3014,
				2946,
				2749,
				2441,
				2054,
				1625,
				1196,
				810,
				503,
				307,
				239
		}
};

fir_data_t tc_bp = {
		21,
		{
				-107,
				-168,
				-268,
				-307,
				-98,
				542,
				1677,
				3175,
				4709,
				5864,
				6294,
				5864,
				4709,
				3175,
				1677,
				542,
				-98,
				-307,
				-268,
				-168,
				-107
		}
};

fir_data_t tc_hp = {
		21,
		{
				72,
				118,
				189,
				200,
				-1,
				-563,
				-1538,
				-2813,
				-4113,
				-5089,
				27257,
				-5089,
				-4113,
				-2813,
				-1538,
				-563,
				-1,
				200,
				189,
				118,
				72
		}
};
