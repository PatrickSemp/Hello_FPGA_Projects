/***********************************************************************************************
 * Company: MicroSemi Corporation
 *
 * File: main.c
 * File history:
 * Revision:
 *
 * Description:recieves the user entered option,address and data through MMUAT interface and sends the data to FPGA fabric.
 *  Recieves the data from FPGA fabric and sends back through MMUART interface.
 *
 * SmartFusion2: SF2 MDDR Demo
 *
 * Author: Applications Engineering
 *
 ************************************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
#include <ctype.h>
#include "drivers/mss_gpio/mss_gpio.h"
#include "drivers/mss_uart/mss_uart.h"

#define APB3_BASE 0x30000000
#define DDR_BASE_ADDR  0xA0000000
#define ADDR_PAGE_1_REDUNDANT  349440
#define ADDR_PAGE_2_REDUNDANT  698880

//VARIABLES

uint32_t cero_data[2]={0,0};
mss_uart_instance_t * const gp_my_uart = &g_mss_uart0;
uint8_t	rx_size=0;
uint8_t rx_buff[1];
uint32_t pos=0;
char str[30];
volatile uint32_t *fab_word_ptr;
int seed;

uint32_t output_buffer_single[100];
uint8_t num_bits=0;
uint8_t binary[8];
uint16_t  i,j;
uint8_t ready2read=0;
uint8_t bit_val=0;
uint32_t nerror=0;

uint32_t num_fi=0;
//========================================
//VARIABLE FOR WRITE OPERADOR
uint8_t operador=0;

// VARIABLES FOR PROTOCOL AXI
uint8_t lenght_data=8;
// VARIABLES FOR PROTOCOL APB3
uint32_t lenght_apb3=1024;
//========================================
//VARIABLES FOR  FAULT INYECTION
const int length_error=5000; 			//Number of faults the user want
const uint8_t length_PAGES=3; 			//Number of pages for redundance
const uint32_t length_ADDR_1P=349440; 	// length address on FIRST PAGE 0<addr<0x554FF(349439) 349439
const uint8_t length_BIT=8;				// Number  of bits in word


//FUNCTIONS
//static void Reader(void);
void read_simple();
void read_burst();
void send_request();
void validate_data();
int scan_hex();
void Fault_Injection();
void delay ( volatile uint32_t n);
void order_numbers(uint32_t arreglo[100], uint32_t lon);
void read_first_frame();
void GPIO0_IRQHandler( void );
void GPIO1_IRQHandler( void );
void * memset ( void * ptr, int value, size_t num );
uint32_t operadores(uint8_t operador);
void sending_injection(uint32_t addr_rand[length_error],uint32_t bit_rand[length_error]);
void read_tpsram(uint32_t *fab_word_ptr);
void * memset ( void * ptr, int value, size_t num );

int main(){
	uint8_t user_option;
	uint32_t address,data[2];
	NVIC_EnableIRQ(GPIO0_IRQn);
	NVIC_EnableIRQ(GPIO1_IRQn);
	MSS_GPIO_config( MSS_GPIO_0, MSS_GPIO_INPUT_MODE | MSS_GPIO_IRQ_EDGE_POSITIVE );
	MSS_GPIO_config( MSS_GPIO_1, MSS_GPIO_INPUT_MODE | MSS_GPIO_IRQ_EDGE_POSITIVE );
	MSS_GPIO_enable_irq( MSS_GPIO_0 );
	MSS_GPIO_enable_irq( MSS_GPIO_1 );
	MSS_UART_init( gp_my_uart, MSS_UART_9600_BAUD, MSS_UART_DATA_8_BITS | MSS_UART_NO_PARITY | MSS_UART_ONE_STOP_BIT );
    while (1){
    	/*
    	//=================================
    	MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r Presiona cualquier tecla \n\r");
		do{
			rx_size=MSS_UART_get_rx( gp_my_uart, &user_option, 1 );
			seed++;                 //Generate seed for random numbers
		}while(rx_size==0);
		uint32_t patron;
		ESCRITURA://PROCESO DE ESCRITURA DE OPERADORES
		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r **********************************************************************\n\r");
		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r ESCRITURA \n\r");
		  switch(operador){
			  case 0:
				patron=1431655765;
				data[0] =patron;
				data[1] =patron;
				send_request('3',address,data);
				break;
			  case 1:
				patron=2058005162;
				data[0] =patron;
				data[1] =patron;
				send_request('3',address,data);
				break;
			  case 2:
				patron=1879048192;
				data[0] =patron;
				data[1] =patron;
				send_request('3',address,data);
				break;
			  case 3:
				patron=2147483647;
				data[0] =patron;
				data[1] =patron;
				send_request('3',address,data);
				break;
			  case 4:
				patron=0;
				data[0] =patron;
				data[1] =patron;
				send_request('3',address,data);
				break;
			  default:
				return 0;
				break;
		  }
		  goto VALIDACION;


		VALIDACION://PROCESO DE LECTURA Y COMPARACION
		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r **********************************************************************\n\r");
		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r VALIDACION \n\r");
			validate_data();
		  goto DECISION;


		DECISION://PROCESO DE SOBRESCRITURA O MULTIPLICACION
		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r **********************************************************************\n\r");
		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r DECISION \n\r");
		  if(bit_val){
			sprintf(str," NUMERO ERORES: %8d \n\r NUMERO FI: %d  \n\r",nerror,num_fi);
			MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)str);
			nerror=0;
			bit_val=0;
			operador++;
			//goto ESCRITURA;
			goto SALIR;
		  }else{
			  MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"NO HAY ERRORES \n\r");
			  goto FINYECTION;
		  }

		FINYECTION:
		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r **********************************************************************\n\r");
		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r INYECCION DE FALLOS \n\r");
		  Fault_Injection();
		  num_fi++;
		  goto VALIDACION;

	  MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)" FIN \n\r");

    }
    //==============================================
*/

    	MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r **********************************************************************\n\r");
    	MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"    	MAIN MENU   \n\r");
        MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"**********************************************************************\n\r");
        MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"OPCION '1'/0x31:\tSimple Write to SDRAM \n\r");
    	MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"OPCION '2'/0x32:\tSimple TPSRAM Read \n\r");
    	MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"OPCION '3'/0x33:\tInitialize Memory\n\r");
    	MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"OPCION '4'/0x34:\tRead Burst to SDRAM \n\r");
    	MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"OPCION '5'/0x35:\tFault Injection \n\r");
    	MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"OPCION '6'/0x36:\tTurn on TMR Automatic \n\r");
		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r Enter  option: ");
		do{
			rx_size=MSS_UART_get_rx( gp_my_uart, &user_option, 1 );
			seed++;									//Generate seed for random numbers
		}while(rx_size==0);
		MSS_UART_polled_tx_string(gp_my_uart,&user_option);



    	switch(user_option){
    	case '1'://SIMPLE WRITE
    		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r Enter  address option \n\r 0x");
    		address = scan_hex();
			MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r Enter  1st data MSB(MAX.4294967295) \n\r 0x");
			data[0] = scan_hex();
			MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r Enter  2nd data LSB (MAX.4294967295) \n\r 0x");
			data[1] = scan_hex();
			send_request(user_option,address,data);
    		break;
    	case '2'://SIMPLE READ
    		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r Enter  address option \n\r 0x");
    		address=scan_hex();
    		memset(data,0,sizeof (data));
    		send_request(user_option,address,data);
    		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r*********************************************\n\r");
    		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r READ 2 OPTION   \n\r");
    		read_simple();
    		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r*********************************************\n\r");
    		break;
    	case '3'://WRITE BURST SDRAM
    		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r Enter  address option \n\r 0x");
    		address=scan_hex();
    		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r*********************************************\n\r");
    		//ESCRITURA:
			data[0] =operadores(operador);
			data[1] =operadores(operador);
			sprintf(str,"\n\r PATRON: %8X \n\r",operadores(operador));
			MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)str);
			MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r*********************************************\n\r");
			send_request('3',address,data);
			num_fi=0;

    		break;
    	case '4'://READ BURST TPSRAM
    		//MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r Enter  address option \n\r 0x");
    		//address=scan_hex();
    	VAL:
    		//memset(data,0,sizeof (data));
    		//send_request('4',0,cero_data);
    		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r*********************************************\n\r");
    		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r READING ALL MEMORY REGISTERS \n\r");
    		//MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r Enter  address option \n\r 0x");
    		//address=scan_hex();
    		//MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r");
    		//send_request('4',address,cero_data);  //carga de datos TPSRAM //cambiar el numero para obtener el TMR
    		//read_burst();
    		//pos=0;
    		validate_data();
    		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r **********************************************************************\n\r");
			MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r DECISION \n\r");
			  if(bit_val){
				sprintf(str," NUMERO ERORES: %d \n\r NUMERO FI: %d  \n\r",nerror,num_fi);
				MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)str);
				nerror=0;
				bit_val=0;
				operador++;
				//goto ESCRITURA;
				//goto SALIR;
			  }else{
				  MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"NO HAY ERRORES \n\r");
				  sprintf(str," NUMERO ERORES: %d \n\r NUMERO FI: %d  \n\r",nerror,num_fi);
				  MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)str);
				  num_fi++;
				  Fault_Injection();
				  goto VAL;
			  }
    		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r*********************************************\n\r");
    		break;
    	case'5':
    		num_fi++;
    		Fault_Injection();
    		break;

    	default:
    		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t *)"\n Incorrect Option.\n\r Select again \n\r");
    		break;
    	}
    	j = 0;
    	i = 0;
    }

SALIR:
	return 0;

}
/***********************************************************************************************
 Interrupt Handlers
************************************************************************************************/

/* GPIO 0 Interrupt Handler */
/* This Interrupt handler executes upon the occurrence of
   GPIO 0 interrupt, which is from the TMR in the FPGA
   Fabric. This function prints source of the interrupt to the
   hyper terminal */
void GPIO0_IRQHandler( void )
  {
	MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"ERROR IN BYTE!!!");
	bit_val=1;
	nerror++;
	MSS_GPIO_clear_irq( MSS_GPIO_0 );
    NVIC_ClearPendingIRQ( GPIO0_IRQn );
  }
void GPIO1_IRQHandler( void ){
	MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n COMPLETE WRITING!!\n\n\r");
	MSS_GPIO_clear_irq( MSS_GPIO_1 );
    NVIC_ClearPendingIRQ( GPIO1_IRQn );
  }


/*========================================================================================
READ REQUEST FOR 8 ADDRESS
========================================================================================*/
void read_simple(){
	fab_word_ptr = (uint32_t *)0x50000000;		//Address 0x30000000
	for(i = 0; i<lenght_data; i++){
		output_buffer_single[i] = *fab_word_ptr;
		sprintf(str,"%p:%8X \n\r",fab_word_ptr,output_buffer_single[i]);
		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)str);
		fab_word_ptr = fab_word_ptr + 1;
	}

	memset(output_buffer_single,0,sizeof (output_buffer_single));
}

void validate_data(){
	for(int a=0;a<=(length_ADDR_1P/lenght_apb3);a++){
		send_request('4',lenght_apb3*a,cero_data);  //carga de datos TPSRAM //cambiar el numero para obtener el TMR
		read_burst();                   //lectura TMR
/*	for(int a=0;a<=1;a++){
		send_request('4',lenght_apb3*a,cero_data);  //carga de datos TPSRAM //cambiar el numero para obtener el TMR
		read_burst();
	*/
	}
	pos=0;
}
/*========================================================================================
READ REQUEST FOR 2048 ADDRESS
========================================================================================*/
void read_burst(){
	delay(400);
	read_tpsram((uint32_t *)0x50000000);
	//read_tpsram((uint32_t *)0x70000000);
}
void read_tpsram(uint32_t *fab_word_ptr){
	uint32_t output_buffer_burst[1024];
	for(int m = 0; m< 1024; m++){					//MAX 0x5000_0FFF->(0xFFF)4096/4=1024
		output_buffer_burst[m] = *fab_word_ptr;
		sprintf(str,"%4d:%8X \t\t",pos,output_buffer_burst[m]);
		//MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)str);
		pos++;
//		 j++;
//		if(j==lenght_data){
//			MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r");
//			j=0;
//		}
		fab_word_ptr = fab_word_ptr + 1;
	}

}

//=================================================================================================
//TRAMA PARA ENVIO DE SOLICITUDES AL DATA_HANDLE_V2 POR APB3
//=================================================================================================
void send_request(uint32_t option_32bit,uint32_t address_32bit,uint32_t data_32bit[2]){
	fab_word_ptr = (uint32_t *)0x30000000;				//Address 0x30000000
	//Write option sample to DATA_HANDLE
	*fab_word_ptr = option_32bit;						//Send for APB3(0x30000000) -> option_buffer1
	 fab_word_ptr = fab_word_ptr + 1;					//New Address 0x30000004

	//Write address sample to SDRAM
	*fab_word_ptr = address_32bit;						//Send for APB3(0x30000004) -> option_buffer1
	 fab_word_ptr = fab_word_ptr + 1;					//New Address 0x30000008

	//Write data_lower32bit sample to SDRAM
	*fab_word_ptr = data_32bit[0];						//Send for APB3(0x30000008) -> option_buffer1
	 fab_word_ptr = fab_word_ptr + 1;					//New Address 0x3000000C
	//Write data_upper32bit sample to SDRAM
	*fab_word_ptr = data_32bit[1];						//Send for APB3(0x3000000C) -> option_buffer1
	 fab_word_ptr = fab_word_ptr + 1;					//New Address 0x30000010
}

//Read data from UART RX
int scan_hex(){
	uint8_t x[8]={0},i=0;//[8];
	int num;
	while(i<8){
		do{
			rx_size=MSS_UART_get_rx(gp_my_uart, rx_buff, sizeof(rx_buff));
			seed++;
		}while(rx_size==0);
		rx_size=0;
        if(rx_buff[0]== '\r')
        	goto exit;

        x[i++]=rx_buff[0];
        MSS_UART_polled_tx(gp_my_uart,rx_buff,sizeof(rx_buff));
	}
	exit:
	num=strtol(x, NULL, 16);
	return num;
}

// Read data in decimal format
int scannumber(){
	uint8_t x[10]={0},i=0;//[8];
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

//Function for Inject Faults to Random Page,Address and Bit
void Fault_Injection(){
	uint32_t page_rand[length_error];	//String for load Random Page
	uint32_t addr_rand[length_error];	//String for load Random Address
	uint32_t bit_rand[length_error]; 	//String for load Random bit

    srand(seed++);
	MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r GENERANDO RANDOM DIRECCIONES... \n\r");
    for (i = 0; i < length_error; i++) {							//Generate random numbers
    	page_rand[i]=1+rand()%(length_PAGES);				//Generate random page
    	addr_rand[i]=rand()%((length_ADDR_1P-1)+1);				//Generate random address
    	bit_rand[i]=rand()%((length_BIT-1)+1);					//Generate random bit
    	 if (i>0){
    		 while(addr_rand[i]== addr_rand[i-1]){ //if is the same number it change
			  addr_rand[i]=rand()%((length_ADDR_1P-1)+1);
		  }
    	 }
     }

    order_numbers(page_rand,length_error);				//Order Pages
    order_numbers(addr_rand,length_error);				//Order Address


    //MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n Random Addresses \n\r" );
    //MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\tPage \t Address \tBit\n\r" );

    for (i = 0; i < length_error; i++) {
        if(page_rand[i]==2){						//Generate offset for Second Page  x"00055500"
            addr_rand[i]=(ADDR_PAGE_1_REDUNDANT)+addr_rand[i];
          }else if(page_rand[i]==3){				//Generate offset for Third Page x"000AAA00"
            addr_rand[i]=(ADDR_PAGE_2_REDUNDANT)+addr_rand[i];
          }
		sprintf(str,"%4d:%4d \t%8X \t%4d \n\r",i+1,page_rand[i],addr_rand[i],bit_rand[i]);
		//MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)str);
    }

   sending_injection(addr_rand,bit_rand);
}

//Sending a series of read simple request given the random address
void sending_injection(uint32_t addr_rand[length_error],uint32_t bit_rand[length_error]){
	uint8_t index_byte;					//Indicate correct byte from frame
	uint32_t data[2];					//Array data to send in request issue

	//MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r Error:\t Address    >>Data[1]\t\tData[2]\n\r" );
	MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"INYECTANDO ERRORES... \n\r");
	for (uint32_t i = 0; i < length_error; i++) {
		delay(20);
		send_request('2',addr_rand[i],cero_data);			// Ready for Read
		//index_byte/=4;
		read_first_frame();								//Read all bytes in frame
		//Show inside addr_rand, which byte is correct
		if(addr_rand[i]<8){
			index_byte= addr_rand[i];
		}else{
			index_byte= addr_rand[i]%8;
		}
		//Injection fault in given address
		output_buffer_single[index_byte]=output_buffer_single[index_byte]^(1 << bit_rand[i]);

		//Reconstruction of the frame to send again, but with the change in the bit
		data[1] = (uint32_t)(output_buffer_single[0] | output_buffer_single[1] << 8 | output_buffer_single[2] << 16 | output_buffer_single[3] << 24 ) ;
		data[0] = (uint32_t)(output_buffer_single[4] | output_buffer_single[5] << 8 | output_buffer_single[6] << 16 | output_buffer_single[7] << 24 ) ;
		//sprintf(str,"\n\r %4d| Error: %8X >>%8X %8X \t Error Injected...\n\r",i+1,addr_rand[i],data[0],data[1]);
		//MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)str);
		//Sending a series of simple write requests given the address and data where inject fault.
		send_request('1',addr_rand[i],data);
		memset(data,0,sizeof (data));
		memset(output_buffer_single,0,sizeof (output_buffer_single));
		delay(40);
	}
}


//Read first Data Frame of 64bits within TPSRAM
void read_first_frame(){
	fab_word_ptr = (uint32_t *)0x50000000;
	j=0;
	for(uint8_t i = 0; i<length_BIT; i++){
		delay(20);
		output_buffer_single[i] = *fab_word_ptr;
		fab_word_ptr = fab_word_ptr + 1;
	/*	sprintf(str,":%X \t ",output_buffer_single[i]);
		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)str);

		 j++;
		if(j==lenght_data){
			MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r");
			j=0;
		}*/
	}
}
//Order the random numbers from least to greatest
void order_numbers(uint32_t arreglo[length_error], uint32_t lon){
	uint32_t temp;
    for (int i = 1; i < lon; i++) {
         for (int j = 0; j < lon - i; j++) {
             if (arreglo[j] > arreglo[j + 1]) {
                 temp = arreglo[j + 1];
                 arreglo[j + 1] = arreglo[j];
                 arreglo[j] = temp;
             }
         }
     }
}
uint32_t operadores(uint8_t operador){
	uint32_t patron;
	//Patron de 5555: 1431655765
	//Patron de 7AAA:	2058005162;
	switch(operador){
		  case 0:
			patron=1431655765;
			break;
		  case 1:
			patron=2058005162;
			break;
		  case 2:
			patron=1879048192;
			break;
		  case 3:
			patron=2147483647;
			break;
		  case 4:
			patron=0;
			break;
		  default:
			return 0;
			break;
	  }
	return patron;
}


//Delay time
void delay ( volatile uint32_t n){
	while(n!=0)	{
		n--;
	}
}

