//LIBRERIAS
#include <stdio.h>
#include <stdlib.h>
#include "drivers/mss_uart/mss_uart.h"

#define Menu_principal \
	"\n\r \
	******************************************* \n\r \
	\t\t MATRICES\n\r \
	1. Dimensiones de Matrices  \n\r \
	2. Editar Matrices \n\r \
	3. Matrices Almacenadas \n\r \
	4. Multiplicacion Matrices \n\r \
	Escoja una opcion: "

//VARIABLES
char str[30];
mss_uart_instance_t * const gp_my_uart = &g_mss_uart0;

//FUNCIONES
int* multiplyMatrices(const int* matrix1, int rows1, int cols1,
                      const int* matrix2, int rows2, int cols2);
void printMatrix(const int* matrix, int rows, int cols) ;
int scannumber();
/*****************************************************************************
 * main function.
 ****************************************************************************/

int main() {
	uint8_t	rx_size=0;
	uint8_t user_option=0;
	// Matrices examples
	int matrix1[100]; //= {1, 2, 3, 4, 5, 6}; // Matriz de 2x3
	int matrix2[100];// = {7, 8, 9, 10, 11, 12}; // Matriz de 3x2

	// Matrices Dimension
/*	int rows1 = 2, cols1 = 3;
	int rows2 = 3, cols2 = 2;*/
	int rows1, cols1;
	int rows2, cols2;
	int *result_m;
	MSS_UART_init( gp_my_uart, MSS_UART_9600_BAUD, MSS_UART_DATA_8_BITS | MSS_UART_NO_PARITY | MSS_UART_ONE_STOP_BIT );

	while(1){
		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)Menu_principal);
		/*MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\t\t MATRICES\n\r");
		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"1. Dimensiones de Matrices  \n\r");
		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"2. Editar Matrices \n\r");
		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"3. Matrices Almacenadas \n\r");
		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"4. Multiplicacion Matrices \n\r");
		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"Escoja una opcion: ");*/
		do{
			rx_size=MSS_UART_get_rx( gp_my_uart, &user_option, 1 );
		}while(rx_size==0);
		MSS_UART_polled_tx_string(gp_my_uart,&user_option);
		//		uint8_t user_opt=scannumber();
		//		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r ");
		switch(user_option){
		case '1':
			/*****************************************************************************
			 * INGRESO DE DIMENSIONES DE MATRICES
			 *****************************************************************************/
			MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r Numero de Filas (Matriz A):");
			rows1=scannumber();
			MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r Numero de Columnas (Matriz A):");
			cols1=scannumber();
			MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r Numero de Filas (Matriz B):");
			rows2=scannumber();
			MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r Numero de Columnas (Matriz B):");
			cols2=scannumber();
			MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r ******************************************* \n\r");
			/*****************************************************************************
			 * INGRESO DE ELEMENTOS DE MATRICES
			 *****************************************************************************/
			for(uint8_t m=0;m<rows1;m++){
				for(uint n=0;n<cols1;n++){
					sprintf(str,"\n\r Elemento Matriz A (%d,%d):",m,n);
					MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)str);
					matrix1[m * cols1 + n]=scannumber();
				}
			}
			MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r ******************************************* \n\r");
			for(uint8_t o=0;o<rows2;o++){
				for(uint p=0;p<cols2;p++){
					sprintf(str,"\n\r Elemento Matriz B (%d,%d):",o,p);
					MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)str);
					matrix2[o * cols2 + p]=scannumber();
				}
			}
			break;
		case '2':

			break;
		case '3':
			MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r Matriz A \n\r");
			printMatrix(matrix1, rows1, cols1);
			MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r Matriz B \n\r");
			printMatrix(matrix2, rows2, cols2);
			MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r ******************************************* \n\r");
			break;
		case '4':
			// Matrix Multiplication function call
			result_m = multiplyMatrices(matrix1, rows1, cols1, matrix2, rows2, cols2);
			if (result_m == NULL) {
				return 1;
			}
			// Print the result matrix
			MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\n\r Matriz resultado:\n\r");
			printMatrix(result_m, rows1, cols2);
			// Release allocated memory
			free(result_m);
			break;
		default :
			MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r Opcion Incorrecta, Vuela a Seleccionar! \n\r");
			break;
		}

	}
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
            sprintf(str,"%4d ", matrix[i * cols + j]);
            MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)str);
        }
        MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r");
    }
}
// Read data in decimal format
int scannumber(){
	uint8_t x[10]={0},i=0,rx_size=0,rx_buff[1];//[8];
	int num;
	while(i<10){
		do{
			rx_size=MSS_UART_get_rx(gp_my_uart, rx_buff, sizeof(rx_buff));
		}while(rx_size==0);
		rx_size=0;
        if(rx_buff[0]== '\r')
        	goto exit;
        x[i++]=rx_buff[0];
        MSS_UART_polled_tx(gp_my_uart,rx_buff,sizeof(rx_buff));
	}
	exit:
	num = atoi(x);
	return num;
}
