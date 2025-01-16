//LIBRERIAS
#include <stdio.h>
#include <stdlib.h>
#include "drivers/mss_uart/mss_uart.h"

//VARIABLES
char str[30];
mss_uart_instance_t * const gp_my_uart = &g_mss_uart0;

//FUNCIONES
int* multiplyMatrices(const int* matrix1, int rows1, int cols1,
                      const int* matrix2, int rows2, int cols2);
void printMatrix(const int* matrix, int rows, int cols) ;
/*****************************************************************************
 * main function.
 ****************************************************************************/

int main() {
	uint8_t	rx_size=0;
	uint8_t user_option;
	MSS_UART_init( gp_my_uart, MSS_UART_9600_BAUD, MSS_UART_DATA_8_BITS | MSS_UART_NO_PARITY | MSS_UART_ONE_STOP_BIT );

//while(1){
	MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r Presiona cualquier tecla \n\r");



    // Matrices examples
    int matrix1[] = {1, 2, 3, 4, 5, 6}; // Matriz de 2x3
    int matrix2[] = {7, 8, 9, 10, 11, 12}; // Matriz de 3x2

    // Matrices Dimension
    int rows1 = 2, cols1 = 3;
    int rows2 = 3, cols2 = 2;

    // Matrix Multiplication function call
    int* result = multiplyMatrices(matrix1, rows1, cols1, matrix2, rows2, cols2);
    if (result == NULL) {
        return 1;
    }

    // Print the result matrix
    MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"Matriz resultado:\n\r");
    printMatrix(result, rows1, cols2);

    // Release allocated memory
    free(result);
    return 0;
}


/*******************************************************************
 * FUNCTIONS
 *******************************************************************/
//Function to multiply two matrices represented as one-dimensional vectors
int* multiplyMatrices(const int* matrix1, int rows1, int cols1,
                      const int* matrix2, int rows2, int cols2) {
    // Check if matrices can be multiplied
    if (cols1 != rows2) {
        MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"No se pueden multiplicar las matrices. Las dimensiones no coinciden.\n\r");
        return NULL;
    }

    //Initialize the result vector
    int* result = (int*)malloc(rows1 * cols2 * sizeof(int));
    if (result == NULL) {
        MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)" Error de asignación de memoria \n\r");
        return NULL;
    }

    //Matrices Multiply
    for (int i = 0; i < rows1; ++i) {
        for (int j = 0; j < cols2; ++j) {
            result[i * cols2 + j] = 0;
            for (int k = 0; k < cols1; ++k) {
                result[i * cols2 + j] += matrix1[i * cols1 + k] * matrix2[k * cols2 + j];
            }
        }
    }

    return result;
}

// Function to print a matrix represented as a one-dimensional vector
void printMatrix(const int* matrix, int rows, int cols) {
    for (int i = 0; i < rows; ++i) {
        for (int j = 0; j < cols; ++j) {
            sprintf(str,"%d ", matrix[i * cols + j]);
            MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)str);
        }
        MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r");
    }
}
