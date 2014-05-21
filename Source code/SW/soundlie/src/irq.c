/**
 * @file irq.c
 * @brief Functions for interrupt handling.
 * @details Functions for enabling, disabling and forcing interrupts.
 * @author Aeroflex Gaisler
 * @version 1.0
 */

#include "irq.h"

int *lreg = (int *) 0x80000000;

void enable_irq (int irq)
{
	lreg[ICLEAR/4] = (1 << irq);	// clear any pending irq
	lreg[IMASK/4] |= (1 << irq);	// unmaks irq
}

void disable_irq (int irq) { lreg[IMASK/4] &= ~(1 << irq); }	// mask irq

void force_irq (int irq) { lreg[IFORCE/4] = (1 << irq); }	// force irq
