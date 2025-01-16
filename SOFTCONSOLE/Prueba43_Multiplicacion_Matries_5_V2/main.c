//LIBRERIAS
#include <stdio.h>
#include <stdlib.h>
#include "drivers/mss_uart/mss_uart.h"
#include "uart_functions/uart_functions.h"
#include "CMSIS/system_m2sxxx.h"

#define MATRIZ1_ADDR  0xA0000000
#define MATRIZ2_ADDR  0xA2000000 //0xB0000000 Se sobreescribe los datos
#define MATRIZ3_ADDR  0xA4000000
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
//int matrix1[100]; //= {1, 2, 3, 4, 5, 6}; // Matriz de 2x3
//int matrix2[100];// = {7, 8, 9, 10, 11, 12}; // Matriz de 3x2
typedef enum{
	TARGET_MATRIX_A,
	TARGET_MATRIX_B,
	TARGET_MATRIX_C
}target_matrix_addr;


mss_uart_instance_t * const gp_my_uart = &g_mss_uart0;

/*****************************************************************************
 * FUNCIONES
 ****************************************************************************/
uint32_t MATRIX_ADDR
(
		target_matrix_addr target
);
void multiplyMatrices(int rows1,int cols1,int rows2,int cols2);
void printMatrix(target_matrix_addr target, uint32_t rows,uint32_t cols);
//int scannumber();
void edit_matrices(
		target_matrix_addr target,
		uint32_t rows,
		uint32_t cols
		);

/*****************************************************************************
 * main function.
 ****************************************************************************/

int main() {
	uint8_t	rx_size=0;
	uint8_t user_option=0;
	uint32_t rows1, cols1,rows2, cols2;

	MSS_UART_init( gp_my_uart, MSS_UART_9600_BAUD, MSS_UART_DATA_8_BITS | MSS_UART_NO_PARITY | MSS_UART_ONE_STOP_BIT );
	while(1){
		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)Menu_principal);
		user_option=scannumber();
		switch(user_option){
		case 1://Enter Matrix
			UART_printf("\n\r Numero de Filas (Matriz A):");
			rows1=scannumber();
			UART_printf("\n\r Numero de Columnas (Matriz A):");
			cols1=scannumber();
			UART_printf("\n\r Numero de Filas (Matriz B):");
			rows2=scannumber();
			UART_printf("\n\r Numero de Columnas (Matriz B):");
			cols2=scannumber();
			edit_matrices(TARGET_MATRIX_A,rows1,cols1);
			edit_matrices(TARGET_MATRIX_B,rows2,cols2);
			UART_printf("\n\r ******************************************* \n\r");
			break;

		case 2://Edit Matrix
			edit_matrices(TARGET_MATRIX_A,rows1,cols1);
			edit_matrices(TARGET_MATRIX_B,rows2,cols2);
			UART_printf("\n\r ******************************************* \n\r");
			break;

		case 3://Print Matrix
			UART_printf("\n\r Matriz A \n\r");
			printMatrix(TARGET_MATRIX_A, rows1, cols1);
			UART_printf("\n\r Matriz B \n\r");
			printMatrix(TARGET_MATRIX_B, rows2, cols2);
			UART_printf("\n\r ******************************************* \n\r");
			break;

		case 4:// Matrix Multiplication
			multiplyMatrices(rows1, cols1,rows2, cols2);
			// Print the result matrix
			UART_printf("\n\r Matriz resultado:\n\r");
			printMatrix(TARGET_MATRIX_C, rows1, cols2);
			break;

		default :
			UART_printf("\n\r Opcion Incorrecta, Vuela a Seleccionar! \n\r");
			break;
		}
	}
    return 0;
}


/*******************************************************************
 * FUNCTIONS
 *******************************************************************/
//Function to multiply two matrices represented as one-dimensional vectors
void multiplyMatrices(int rows1,int cols1,int rows2,int cols2) {
	int *dt_M1=(int *)MATRIZ1_ADDR;
	int *dt_M2=(int *)MATRIZ2_ADDR;
	int *dt_M3=(int *)MATRIZ3_ADDR;
    // Check if matrices can be multiplied
    if (cols1 != rows2) {
        UART_printf("No se pueden multiplicar las matrices. Las dimensiones no coinciden.\n\r");
    }else{
    	//Matrices Multiply
		for (int i = 0; i < rows1; ++i) {
			for (int j = 0; j < cols2; ++j) {
				//result[i * cols2 + j] = 0;
				*dt_M3 = 0;
				for (int k = 0; k < cols1; ++k) {
					//result[i * cols2 + j] += matrix1[i * cols1 + k] * matrix2[k * cols2 + j];
					dt_M1=(int *)MATRIZ1_ADDR + (i * cols1) + k;
					dt_M2=(int *)MATRIZ2_ADDR + (k * cols2) + j;
					*dt_M3= *dt_M3 + ((*dt_M1) * (*dt_M2));
				}
				dt_M3+=1;
			}
		}
    }
}

// Function to print a matrix represented as a one-dimensional vector
void printMatrix(target_matrix_addr target, uint32_t rows,uint32_t cols) {
	int *data_read=(int *)(MATRIX_ADDR(target));
/*	switch(matrix){
	case '1':
		data_read=(int *)(MATRIZ1_ADDR);
		break;
	case '2':
		data_read=(int *)(MATRIZ2_ADDR);
		break;
	case '3':
		data_read=(int *)(MATRIZ3_ADDR);
		break;
	default:
		UART_printf("NULL");
		break;
	}*/
	for (int i = 0; i < rows; ++i) {
		for (int j = 0; j < cols; ++j) {
			UART_printf("%d ",*data_read);
			data_read+=1;
		}
		UART_printf("\n\r");
	}
}


/*****************************************************************************
 * INGRESO DE ELEMENTOS DE MATRICES
 *****************************************************************************/
void edit_matrices(target_matrix_addr target,uint32_t rows,uint32_t cols){
	int *data_send=(int *)(MATRIX_ADDR(target));
	for(uint32_t m=0;m<rows;m++){
		for(uint32_t n=0;n<cols;n++){
			UART_printf("\n\r Elemento Matriz A (%d,%d):",m,n);
			*data_send=scannumber();
			data_send+=1;
			//matrix1[m * cols1 + n]=scannumber();
		}
	}
}
//	UART_printf("\n\r ******************************************* \n\r");
//	data_send=(int *)(MATRIZ2_ADDR);
//	for(uint32_t o=0;o<rows2;o++){
//		for(uint32_t p=0;p<cols2;p++){
//			UART_printf("\n\r Elemento Matriz B (%d,%d):",o,p);
//			*data_send=scannumber();
//			data_send+=1;
//			//matrix2[o * cols2 + p]=scannumber();
//		}
//	}

uint32_t MATRIX_ADDR(target_matrix_addr target) {
	switch (target) {
	case TARGET_MATRIX_A:
		UART_printf("\n\r Matriz A \n\r");
		return MATRIZ1_ADDR;
		//UART_printf("%p\n\r ",data_read);
		break;
	case TARGET_MATRIX_B:
		UART_printf("\n\r Matriz B \n\r");
		return MATRIZ2_ADDR;
		break;
	case TARGET_MATRIX_C:
		UART_printf("\n\r Matriz C \n\r");
		return MATRIZ3_ADDR;
		break;
	}
	return 0;
}

