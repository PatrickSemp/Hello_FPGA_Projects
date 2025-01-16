/*
 * uart_functions.c
 *
 *  Created on: Jul 18, 2024
 *      Author: Pedro Sanchez
 */
#include "uart_functions.h"
#include "../drivers/mss_uart/mss_uart.h"
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <ctype.h>  // To handle character conversion functions

#ifdef __cplusplus
extern "C" {
#endif

extern mss_uart_instance_t *gp_my_uart;
static uint8_t UART_read();

/**************************************************
 * The read_uart() function is used to read the content of
 * UART in ASCII format.
 * Just read one element.
 */
static uint8_t UART_read(){
	uint8_t data;
	uint8_t rx_size=0;
	do{
		rx_size=MSS_UART_get_rx(gp_my_uart, &data, 1 );
	}while(rx_size==0);
	MSS_UART_polled_tx(gp_my_uart,&data,sizeof(data));
	return data;
}

// Read data in decimal format
int scannumber(){
	int num;
	uint8_t i = 0;
	uint8_t buffer[10];			//Max 10 elements is able to read over UART
    // Leer datos desde UART hasta encontrar '\r' o llenar el buffer
    do {
        buffer[i] = UART_read();
    } while (buffer[i++] != '\r' && i < sizeof(buffer) - 1);
    buffer[i] = '\0';
	num = strtol((const char *)buffer,NULL , 10);
	return num;
}

//Transmit data to send formatted text over UART
void UART_printf(const char *format, ...) {
    char *str;
    int r;
    va_list args;						// Variable to access the variable arguments.
    va_start(args, format); 			// Initialize variable argument list
    r = vasprintf(&str, format, args);	// Formatted string with variable arguments
    // Send string via UART if formatting was successful
    if (r != -1) {
        MSS_UART_polled_tx(gp_my_uart, str, r);
        free(str); // Clear memory allocated by vasprintf
    }
    // Clear variable argument list
    va_end(args);
}

//Receive formatted data over UART
/*void UART_scanf(const char *format, ...) {
    va_list args;
    va_start(args, format);

    uint8_t buffer[10];			//Max 10 elements is able to read over UART
    uint8_t *buf_ptr = buffer; //Usar un puntero para recorrer el buffer
    uint8_t i = 0;
    // Leer datos desde UART hasta encontrar '\r' o llenar el buffer
    do {
        buffer[i] = UART_read();
    } while (buffer[i++] != '\r' && i < sizeof(buffer) - 1);

    buffer[i] = '\0';

    const char *ptr = format;
	while (*ptr != '\0') {
		if (*ptr == '%' && *(ptr + 1) != '\0') {
			ptr++;
			switch (*ptr) {
				case 'd': {
					int *int_ptr = va_arg(args, int *);
					*int_ptr = strtol((const char *)buf_ptr,NULL , 10);
					// Avanzar buf_ptr hasta el siguiente no dígito
					while (isdigit(*buf_ptr)) buf_ptr++;
					buf_ptr++;
					break;
				}
				case 'x': {
					int *int_ptr = va_arg(args, int *);
					*int_ptr = strtol((const char *)buf_ptr, NULL, 16);
					// Avanzar buf_ptr hasta el siguiente no dígito hexadecimal
					while (isxdigit(*buf_ptr)) buf_ptr++;
					break;
				}
				case 'f': {
					float *float_ptr = va_arg(args, float *);
					*float_ptr = strtof((const char *)buf_ptr, NULL);
					// Avanzar buf_ptr hasta el siguiente no dígito o punto
					while (isdigit(*buf_ptr) || *buf_ptr == '.') buf_ptr++;
					break;
				}
				case 'c': {
					char *char_ptr = va_arg(args, char *);
					*char_ptr = *buf_ptr;
					buf_ptr++;
					break;
				}
				case 's': {
					char *str_ptr = va_arg(args, char *);
					while (!isspace(*buf_ptr) && *buf_ptr != '\0') {
						*str_ptr++ = *buf_ptr++;
					}
					*str_ptr = '\0';
					break;
				}
				default:
					// Manejo de error para formato desconocido
					break;
			}
		}
		ptr++;
	}
	va_end(args);
}*/
#ifdef __cplusplus
}
#endif
