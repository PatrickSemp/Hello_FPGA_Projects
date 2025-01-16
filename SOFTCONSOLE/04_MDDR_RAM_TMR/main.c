/*
 * main.c
 *
 *  Created on: Dec 27, 2023
 *      Author: Patricio
 */
#include "drivers/mss_sys_services/mss_sys_services.h"
#include "drivers/mss_uart/mss_uart.h"
#include "drivers/mss_hpdma/mss_hpdma.h"
#include "drivers/mss_timer/mss_timer.h"
#include "hal/hal.h"
#include "config_val.h"
#include <stdlib.h>
#include <stdio.h>

//----------------------------------------------
//DECLARACION FUNCIONES
//----------------------------------------------
void delay(int num);
void init_memory();
void read_TMR();
void inyection_faults();
void SDRAM_read();
int scannumber();
void printnumber(int32_t n);
void validar_num(uint32_t *dato,uint32_t Limit_max);
void write_data(uint32_t *address, uint32_t data);
void one_memoryrd(uint32_t *mem_ptr);
//----------------------------------------------
//VARIABLES
//----------------------------------------------

mss_uart_instance_t * const gp_my_uart = &g_mss_uart0;
uint32_t 	addr;
int32_t 	data;								//Variable para lectura de datos con signo
uint8_t		rx_size=0;							//Variables necesarias en RX data
uint32_t 	*mem_ptr=0;
uint8_t 	rx_buff[1];
uint32_t 	*mem_ptr2=(uint32_t *)BASE_ADDR_SDRAM_B;
uint32_t 	*mem_ptr3=(uint32_t *)BASE_ADDR_SDRAM_C;
const uint32_t Megas = 1000000;
const uint32_t Gigas = 1000000000;
const uint32_t NUM_DATA=50; // Numero de registros/4=NUM_DATA  Ej.1024 reg / 4 = 256

int main(void){

	MSS_UART_init( gp_my_uart, MSS_UART_9600_BAUD, MSS_UART_DATA_8_BITS | MSS_UART_NO_PARITY | MSS_UART_ONE_STOP_BIT );
	MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"**********************************************************************\n\r");
	MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"    	Bienvenido a SmartFusion2  \n\r");
    MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"**********************************************************************\n\r");
	while(1){
		//MENU PRINCIPAL
		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t *)"\n\r Selecciona una opcion:\n\r");
		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t *)"1. Inicializar SDRAM 200 reg \n\r");
		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t *)"2. Leer 200 registros de SDRAM \n\r");
		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t *)"3. Inyectar errores aleatorios \n\r");
		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t *)"4. Obtener valores TMR \n\r");
		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t *)"5. Lectura datos 1 memoria \n\r");
		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t *)"6. Salir \n\r");
		//ESPERA A SELECCIONAR UNA OPCION
		do{
			rx_size=MSS_UART_get_rx(gp_my_uart, rx_buff, 1);
		}while(rx_size==0);
        MSS_UART_polled_tx_string(gp_my_uart,(uint8_t *)rx_buff);	//Salto de linea
        rx_size=0;
        switch(rx_buff[0]){
        case SEL_1:
            init_memory();
        	break;
        case SEL_2:
        	SDRAM_read();
        	break;
        case SEL_3:
        	inyection_faults();
        	SDRAM_read();
        	break;
        case SEL_4:
        	read_TMR();
        	break;
        case SEL_5:
        	one_memoryrd((uint32_t *)BASE_ADDR_SDRAM_A);
        	one_memoryrd((uint32_t *)BASE_ADDR_SDRAM_B);
        	one_memoryrd((uint32_t *)BASE_ADDR_SDRAM_C);
        	break;
        case 0x36:
        	goto out_pri;
        	break;
        default:
            MSS_UART_polled_tx_string(gp_my_uart,(uint8_t *)"\n Opcion Incorrecta.\n\r Vuelva a Seleccionar \n\r");
        	break;
        }
	}
	out_pri:
	return 0;
}


//-------------------------------------------------------
//		FUNCIONES
//-------------------------------------------------------
/*************************************************************************
 Name			:SDRAM_write
 * Description	:Write data to a given memory address
*************************************************************************/
void inyection_faults(){
	//MSS_TIM1_start();
	uint8_t val_rand[100];
	uint8_t bank_rand[100];
	uint32_t num_ft=0;
	uint8_t i, j, k;
    MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n Ingrese el numero de fallas a inyectar MAX.50\n\r" );
    num_ft=scannumber();
    validar_num(&num_ft,49);
    //Generacion de numeros Aleatorios
    for (i = 0; i < num_ft; i++) {
    	val_rand[i]=1+rand()%((NUM_DATA+1)-1);
    	bank_rand[i]=1+rand()%(4-1);
          if (i>0){
        	  while(val_rand[i]== val_rand[i-1]){ //Se cambia el valor si se repite
        		  val_rand[i]=1+rand()%((NUM_DATA+1)-1);
        	  }
          }
     }
    //Ordenar los numeros aleatorios del menor al mayor
     for (i = 1; i < num_ft; i++) {
         for (j = 0; j < num_ft - i; j++) {
             if (val_rand[j] > val_rand[j + 1]) {
                 k = val_rand[j + 1];
                 val_rand[j + 1] = val_rand[j];
                 val_rand[j] = k;
             }
         }
     }
    MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n Direcciones Aleatorias \n\r" );
    for (i = 0; i < num_ft; i++) {
    	MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n Dato\tMemoria \n\r" );
	 	printnumber((uint32_t) val_rand[i]);
	 	MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\t" );
	 	printnumber((uint32_t) bank_rand[i]);
    	MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r");
    }

    MSS_UART_polled_tx_string(gp_my_uart,(uint8_t *)"\n\r");	//Salto de linea
    MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"**********************************************************************\n\r");
	MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"       Inyectando Errores Aleatorios \n\r");
	MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"**********************************************************************\n\r");

	mem_ptr=(uint32_t *)BASE_ADDR_SDRAM_A;
	mem_ptr2=(uint32_t *)BASE_ADDR_SDRAM_B;
	mem_ptr3=(uint32_t *)BASE_ADDR_SDRAM_C;
	k=0;
	for(i=0;i<val_rand[num_ft-1];i++){
			 for(j=0;j<3;j++){
				 	if(j==0){
						 if((bank_rand[k]==j+1) && (val_rand[k]==i+1)){
							 *mem_ptr = 0xAAAA;
							 k++;
						 }
				 	}
				 	else if(j==1){
				 		if((bank_rand[k]==j+1) && (val_rand[k]==i+1)){
							 *mem_ptr2 = 0xBBB;
							 k++;
						 }
				 	}
				 	else{
				 		if((bank_rand[k]==j+1) && (val_rand[k]==i+1)){
						 *mem_ptr3 = 0xCCCC;
					 	 k++;
					 }
				 	}
			 	 }
			 mem_ptr++;
			 mem_ptr2++;
			 mem_ptr3++;
		 }
/*	j=0;//Primer valor de val_rand[0]
	mem_ptr=(uint32_t *)BASE_ADDR_SDRAM_A;
	for(i=0;i<NUM_DATA;i++){
		if(val_rand[j]==i+1){
			*mem_ptr = 0x5555;
			j++;
		}
			 mem_ptr++;
	}*/
	MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r Completado!!! \n\r");


}

/*************************************************************************
 Name			:SDRAM_read
 Description	:Read data to a given memory address
*************************************************************************/
void SDRAM_read(){
	MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r**********************************************************************\n\r");
	MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"       Leyendo Registros SDRAM \n\r");
	MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"**********************************************************************\n\r");
	mem_ptr	=(uint32_t *)BASE_ADDR_SDRAM_A;
	mem_ptr2=(uint32_t *)BASE_ADDR_SDRAM_B;
	mem_ptr3=(uint32_t *)BASE_ADDR_SDRAM_C;
	char str[19];
	 MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"   A		 	 B				C \n\r");
	 for(uint32_t i=0;i<NUM_DATA;i++){
		 for(uint8_t j=0;j<3;j++){
			 if(j==0){
				 data =  *(uint32_t *)mem_ptr;
				 mem_ptr++;
			 }else if(j==1){
				 data =  *(uint32_t *)mem_ptr2;
				 mem_ptr2++;
			 }else if(j==2){
				 data =  *(uint32_t *)mem_ptr3;
				 mem_ptr3++;
			 }
			 sprintf(str,"%#8X \t\t",data);
			 MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)str);
		 }
		 MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r");//SALTO DE LINEA FILAS
	 }
}

void read_TMR(){
	MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r Ingresa Primera direccion entre 1 a 50 para leer \n\r" );
    addr=scannumber();
    validar_num(&addr,NUM_DATA);
    data =  *(uint32_t *)((addr-1)*4 + BASE_ADDR_SDRAM_A);

    MSS_UART_polled_tx_string(gp_my_uart,(const uint8_t*)"\n Datos leidos:\n\r" );
    printnumber(data);
	uint32_t *apb3_data=0;//puntero para enviar datos por APB3
    apb3_data=(uint32_t *)(BASE_ADDR_APB3 + (addr_t) MEMORY_1);
    HW_set_32bit_reg((addr_t)apb3_data,(uint32_t)data);


	MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r Ingresa Segunda direccion entre 1 a 50 para leer \n\r" );
    addr=scannumber();
    validar_num(&addr,NUM_DATA);
    data =  *(uint32_t *)((addr-1)*4 + BASE_ADDR_SDRAM_B);
    MSS_UART_polled_tx_string(gp_my_uart,(const uint8_t*)"\n Datos leidos:\n\r" );
    printnumber(data);
    apb3_data=(uint32_t *)(BASE_ADDR_APB3 + (addr_t) MEMORY_2);
    HW_set_32bit_reg((addr_t)apb3_data,(uint32_t)data);


	MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r Ingresa Tercera direccion entre 0 to 8188 para leer \n\r" );
    addr=scannumber();
    validar_num(&addr,NUM_DATA);
    data =  *(uint32_t *)((addr-1)*4+ BASE_ADDR_SDRAM_C);
    MSS_UART_polled_tx_string(gp_my_uart,(const uint8_t*)"\n Datos leidos:\n\r" );
    printnumber(data);
    apb3_data=(uint32_t *)(BASE_ADDR_APB3 + (addr_t) MEMORY_3);
    HW_set_32bit_reg((addr_t)apb3_data,(uint32_t)data);

    MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\n\r*************  Datos Desde TMR  *****************************\n\r");
    apb3_data=(uint32_t *)(BASE_ADDR_APB3 + (addr_t) FULL_MEMORY);
    data=HW_get_32bit_reg((addr_t)apb3_data);
    printnumber(data);
}
/**************************************************************************/
/* Name			:init_memory
 * Description	:Initialize memory loading ones in 1GB                                                                 */
/**************************************************************************/
void init_memory(){

	MSS_UART_polled_tx_string(gp_my_uart,(uint8_t *)"\n\r");	//Salto de linea
	MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"**********************************************************************\n\r");
	MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"       Inicializando memoria SDRAM \n\r");
    MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"**********************************************************************\n\r");

/*	=======================================================================================
	INICIALIZAR EL PRIMER ESPACIO DE DIRECCIONES DDR_0_SPACE_0
	Unicamente se va inicializar 1024 reg con un patron determinado
	Direcciones 128M
	Data   		8*/

    //write_data((uint32_t *)BASE_ADDR_SDRAM_A,0x55555555);
    uint32_t i;
    uint8_t j=0;
    uint32_t 	*addr=0,*addr2,*addr3;
    addr=(uint32_t *)BASE_ADDR_SDRAM_A;
    	for(i=0;i<NUM_DATA;i++){
    		*addr = 0x55555555; //Valor maximo para 32bits 0x7fffffff
    		addr++;
    		 j++;
    		 MSS_UART_polled_tx_string(gp_my_uart,(const uint8_t*)".");
    		 if(j==3){
    			 MSS_UART_polled_tx_string(gp_my_uart,(const uint8_t*)" \t \t ");
    			 MSS_UART_polled_tx_string(gp_my_uart,(const uint8_t*)"\r");
    			 j=0;
    		 }
    	}
    	one_memoryrd((uint32_t *)BASE_ADDR_SDRAM_A);
    	j=0;
    	i=0;
//	=======================================================================================
//	INICIALIZAR EL SEGUNDO ESPACIO DE DIRECCIONES DDR_0_SPACE_1
	//write_data((uint32_t *)BASE_ADDR_SDRAM_B,0x5AAAAAAA);
    	addr2=(uint32_t *)BASE_ADDR_SDRAM_B;
		for(i=0;i<NUM_DATA;i++){
			*addr2 =(uint32_t) 0x7AAAAAAA; //Valor maximo para 32bits 0x7fffffff
			addr2++;
			 j++;
			 MSS_UART_polled_tx_string(gp_my_uart,(const uint8_t*)".");
			 if(j==3){
				 MSS_UART_polled_tx_string(gp_my_uart,(const uint8_t*)" \t \t ");
				 MSS_UART_polled_tx_string(gp_my_uart,(const uint8_t*)"\r");
				 j=0;
			 }
		}
    	one_memoryrd((uint32_t *)BASE_ADDR_SDRAM_B);
    	j=0;
    	i=0;
/*	=======================================================================================
//	INICIALIZAR EL SEGUNDO ESPACIO DE DIRECCIONES DDR_0_SPACE_1*/
	//write_data((uint32_t *)BASE_ADDR_SDRAM_C,0x5A5A5A5A);
		addr3=(uint32_t *)BASE_ADDR_SDRAM_C;
		for(i=0;i<NUM_DATA;i++){
			*addr3 = 0x5A5A5A5A; //Valor maximo para 32bits 0x7fffffff
			addr3++;
			 j++;
			 MSS_UART_polled_tx_string(gp_my_uart,(const uint8_t*)".");
			 if(j==3){
				 MSS_UART_polled_tx_string(gp_my_uart,(const uint8_t*)" \t \t ");
				 MSS_UART_polled_tx_string(gp_my_uart,(const uint8_t*)"\r");
				 j=0;
			 }
		}
		one_memoryrd((uint32_t *)BASE_ADDR_SDRAM_C);
	delay(1000);
    MSS_UART_polled_tx_string(gp_my_uart,(const uint8_t*)"\n\r Completado!!! \n\r");
}
/**************************************************************************/
/* Name			:write_data
 * Description	:write data in given address                                                            */
/**************************************************************************/
void write_data(uint32_t *address, uint32_t data){
	uint32_t i;
	uint8_t j=0;
	for(i=0;i<NUM_DATA;i++){
		*address = data; //Valor maximo para 32bits 0x7fffffff
		address++;
		 j++;
		 MSS_UART_polled_tx_string(gp_my_uart,(const uint8_t*)".");
		 if(j==3){
			 MSS_UART_polled_tx_string(gp_my_uart,(const uint8_t*)" \t \t ");
			 MSS_UART_polled_tx_string(gp_my_uart,(const uint8_t*)"\r");
			 j=0;
		 }
	}
}
void delay(int num){
	while(num>0){
		num--;
	}
}
void validar_num(uint32_t *dato,uint32_t Limit_max){
    while(*dato<1 || *dato>Limit_max){
		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n Ingresa una direccion Correcta \n\r" );
		*dato=scannumber();
	}
}
int scannumber(){
	uint8_t x[8]={0},i=0;//[8];
	int num;
	while(i<8){
		do{
			rx_size=MSS_UART_get_rx(gp_my_uart, rx_buff, sizeof(rx_buff));
		}while(rx_size==0);
		rx_size=0;
        if(rx_buff[0]== '\r')
        	goto exit;

        x[i++]=rx_buff[0];
        MSS_UART_polled_tx(gp_my_uart,rx_buff,sizeof(rx_buff));		//Impresion Opcion Escogida
	}
	exit:
	num = atoi(x);
	return num;
}

void printnumber(int32_t n)//int32_t is need for the signal negative
    {
        char str[100];			//Character Vector
        sprintf(str,"%d",n);
        MSS_UART_polled_tx_string(gp_my_uart, (uint8_t*)str);
}
void one_memoryrd(uint32_t *mem_ptr){
	char str[19];
	uint32_t data;
	MSS_UART_polled_tx_string(gp_my_uart,(uint8_t *)"\n\r");	//Salto de linea
	MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"**********************************************************************\n\r");
	MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"       Leyendo Registros SDRAM \n\r");
	MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"**********************************************************************\n\r");
	 uint8_t i;
	 uint8_t j=0;
	 //for(i=0;i<(32*Megas);i++){// 128M / 4 bytes = 32M addres
	 for(i=0;i<50;i++){
	 	data =  *mem_ptr ;
		sprintf(str,"%d:%#8X \t\t",i+1,data);
		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)str);
	 	mem_ptr++;
	 	j++;
	 	if(j==5){
	 		MSS_UART_polled_tx_string(gp_my_uart,(uint8_t*)"\n\r");//SALTO DE LINEA FILAS
			j=0;
	 	}
	}
}
