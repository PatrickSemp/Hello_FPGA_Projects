/*
 * uart_functions.h
 *
 *  Created on: Jul 18, 2024
 *      Author: Patricio
 */

#ifndef UART_FUNCTIONS_UART_FUNCTIONS_H_
#define UART_FUNCTIONS_UART_FUNCTIONS_H_
#include <stdint.h> //libreria para manera datos tipo uint8_t,uint16_t,uint32_t

#ifdef __cplusplus
extern "C" {
#endif


int scannumber();
/*The UART_printf() function is used to transmit data,with a change to stdout.
 * This function allows you to use a syntax similar to "printf"
 * to send formatted text over UART.
 */
void UART_printf(const char *format, ...);

/**************************************************
 * The UART_scanf() function is used to receive data with a change to stdin.
 *  This function allows you to use a syntax similar to "scanf"
 *  to read and formatted data over UART.
 */
//void UART_scanf(const char *format, ...);

#ifdef __cplusplus
}
#endif

#endif /* UART_FUNCTIONS_UART_FUNCTIONS_H_ */
