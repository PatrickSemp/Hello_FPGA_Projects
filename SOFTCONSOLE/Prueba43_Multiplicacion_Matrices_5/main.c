//LIBRERIAS
#include <stdio.h>
#include <stdlib.h>
#include "drivers/mss_uart/mss_uart.h"
#include "drivers/mss_timer/mss_timer.h"
#include "CMSIS/system_m2sxxx.h"

#define MATRIZ1_ADDR  0xA0000000
#define MATRIZ2_ADDR  0xA2000000
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
char str[30];
//int matrix1[100]; //= {1, 2, 3, 4, 5, 6}; // Matriz de 2x3
//int matrix2[100];// = {7, 8, 9, 10, 11, 12}; // Matriz de 3x2
mss_uart_instance_t * const gp_my_uart = &g_mss_uart0;

/*****************************************************************************
 * FUNCIONES
 ****************************************************************************/
void multiplyMatrices(int rows1,int cols1,int rows2,int cols2);
void printMatrix(uint8_t matrix, uint32_t rows,uint32_t cols);
int scannumber();
void edit_matrices(uint32_t rows1,uint32_t cols1,uint32_t rows2,uint32_t cols2);
/*****************************************************************************
 * main function.
 ****************************************************************************/

int main() {
	uint8_t	rx_size=0;
	uint8_t user_option=0;
	uint32_t timer1_load_value;
	uint32_t timer_send;
	uint32_t current_value_u = 0;
	uint32_t current_value_l = 0;

	// Matrices examples
/*	int rows1 = 2, cols1 = 3;
	int rows2 = 3, cols2 = 2;*/
	SystemCoreClockUpdate();
	uint32_t rows1, cols1,rows2, cols2;
	MSS_UART_init( gp_my_uart, MSS_UART_9600_BAUD, MSS_UART_DATA_8_BITS | MSS_UART_NO_PARITY | MSS_UART_ONE_STOP_BIT );

	timer1_load_value = 100000000*8;
	//MSS_TIM1_init(MSS_TIMER_ONE_SHOT_MODE);
	MSS_TIM64_init(MSS_TIMER_ONE_SHOT_MODE);

	while(1){
		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)Menu_principal);
		do{
			rx_size=MSS_UART_get_rx( gp_my_uart, &user_option, 1 );
		}while(rx_size==0);
		MSS_UART_polled_tx(gp_my_uart,&user_option,sizeof(user_option));

		switch(user_option){
		case '1':
			/*****************************************************************************
			 * INGRESO DE DIMENSIONES DE MATRICES
			 *****************************************************************************/
			rows1=127;
			cols1=127;
			rows2=127;
			cols2=127;
//			MSS_TIM1_load_immediate(timer1_load_value);
//			MSS_TIM1_start();
			edit_matrices(rows1,cols1,rows2,cols2);
//			timer_send=MSS_TIM1_get_current_value();
//			sprintf(str,"\n\r Tiempo de Escritura: %d",timer_send);
//			MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)str);
			//MSS_TIM1_enable_irq();
			break;

		case '2':
			edit_matrices(rows1,cols1,rows2,cols2);
			MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r ******************************************* \n\r");
			break;

		case '3':
			MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r Matriz A \n\r");
			printMatrix('1', rows1, cols1);
			MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r Matriz B \n\r");
			printMatrix('2', rows2, cols2);
			MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r ******************************************* \n\r");
			break;

		case '4':
			// Matrix Multiplication function call
//			MSS_TIM1_load_immediate(timer1_load_value);
//			MSS_TIM1_start();
			MSS_TIM64_load_immediate(0,timer1_load_value);
			MSS_TIM64_start();
			multiplyMatrices(rows1, cols1,rows2, cols2);
			MSS_TIM64_get_current_value( &current_value_u, &current_value_l );
			//timer_send=MSS_TIM1_get_current_value();
			sprintf(str,"\n\r Tiempo de Escritura: %10d,\t %10d",current_value_u,current_value_l);
			MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)str);
			MSS_TIM64_enable_irq();

			// Print the result matrix
			//MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\n\r Matriz resultado:\n\r");
			//printMatrix('3', rows1, cols2);
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
void multiplyMatrices(int rows1,int cols1,int rows2,int cols2) {
	int *dt_M1=(int *)MATRIZ1_ADDR;
	int *dt_M2=(int *)MATRIZ2_ADDR;
	int *dt_M3=(int *)MATRIZ3_ADDR;
    // Check if matrices can be multiplied
    if (cols1 != rows2) {
        MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"No se pueden multiplicar las matrices. Las dimensiones no coinciden.\n\r");
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
void printMatrix(uint8_t matrix, uint32_t rows,uint32_t cols) {
/*    for (int i = 0; i < rows; ++i) {
        for (int j = 0; j < cols; ++j) {
            sprintf(str,"%4d ", matrix[i * cols + j]);
            MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)str);
        }
        MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r");
    }*/
	int *data_read=(int *)(MATRIZ1_ADDR);
	switch(matrix){
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
		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"NULL");
		break;
	}
	for (int i = 0; i < rows; ++i) {
		for (int j = 0; j < cols; ++j) {
			sprintf(str,"%4d ", *data_read);
			//sprintf(str,"%4d ", matrix[i * cols + j]);
			MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)str);
			data_read+=1;
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

/*****************************************************************************
 * INGRESO DE ELEMENTOS DE MATRICES
 *****************************************************************************/
void edit_matrices(uint32_t rows1,uint32_t cols1,uint32_t rows2,uint32_t cols2){
	int *data_send=(int *)(MATRIZ1_ADDR);
	for(uint32_t m=0;m<rows1;m++){
		for(uint32_t n=0;n<cols1;n++){
			//sprintf(str,"\n\r Elemento Matriz A (%d,%d):",m,n);
			//MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)str);
			*data_send=1;
			data_send+=1;
			//matrix1[m * cols1 + n]=scannumber();
		}
	}
	MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r ******************************************* \n\r");
	data_send=(int *)(MATRIZ2_ADDR);
	for(uint32_t o=0;o<rows2;o++){
		for(uint32_t p=0;p<cols2;p++){
			//sprintf(str,"\n\r Elemento Matriz B (%d,%d):",o,p);
			//MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)str);
			*data_send=2;
			data_send+=1;
			//matrix2[o * cols2 + p]=scannumber();
		}
	}
}
void Timer1_IRQHandler(void){
	MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r CONTEO TERMINADO... \n\r");
	MSS_TIM64_clear_irq();
}
