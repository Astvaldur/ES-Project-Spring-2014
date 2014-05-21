/**
 * @file irq.c
 * @brief Functions for interrupt handling.
 * @details Functions for enabling, disabling and forcing interrupts.
 * @author Aeroflex Gaisler
 * @version 1.0
 */

#include "irq.h"

int *lreg = (int *) 0x80000000;

/**
 * Enables the given irq id
 * @param  [in]  irq	The id of the interrupt to be enabled
 */
void enable_irq (int irq)
{
	lreg[ICLEAR/4] = (1 << irq);	// clear any pending irq
	lreg[IMASK/4] |= (1 << irq);	// unmask irq
}

/**
 * Disables the given irq id
 * @param  [in]  irq	The id of the interrupt to be enabled
 */
void disable_irq (int irq) {
	lreg[IMASK/4] &= ~(1 << irq);	// mask irq
}
