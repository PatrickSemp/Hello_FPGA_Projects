/*
 * main.c
 *
 *  Created on: Dec 4, 2023
 *      Author: Pedro Patricio
 */
#include "drivers/mss_sys_services/mss_sys_services.h"
#include "hal/hal.h"

#define BASE_ADDR_0             					(addr_t)(0x30000000U)
#define BASE_ADDR_1             					(addr_t)(0xA0000000U)

#define FULL_MEMORY                   	    		(addr_t)(0x00000000u)//All Memory Block
#define MEMORY_1                   	    			(addr_t)(0x00000100u)//First Block of Memory
#define MEMORY_2                   	    			(addr_t)(0x00000200u)//Second Block of Memory
#define MEMORY_3                   	    			(addr_t)(0x00000300u)//Third Block of Memory

#define FIRST_ADDR                   	    		(addr_t)(0x00000000u)// 160

//static void sys_services_event_handler(uint8_t opcode, uint8_t response);
void delay(int num);
void init_memory();
void write_memoria01();
void read_memoria01();
void read_from_TMR();
int main(void){
	init_memory();

	uint32_t *mem_ptr;

	mem_ptr = BASE_ADDR_1;
	*mem_ptr = 0x12345678;

	uint32_t readback = *mem_ptr;

	while (1){
		//LECTURA CON TMR PARA OBSERVAR LOS DATOS LEIDOS
		read_from_TMR();
		//ESCRITURA EN LA PRIMERA MEMORIA PARA EVALUACION
		write_memoria01();
		read_memoria01();
		delay(200);
		//LECTURA TMR PARA OBSERVAR EL ENMASCARAMIENTO
		read_from_TMR();
	}



}

//static void sys_services_event_handler(uint8_t opcode, uint8_t response)
//{
//	volatile uint32_t inc;
//
//	if(FLASH_FREEZE_SHUTDOWN_OPCODE == opcode)
//	{
//		delay(1000);
//	}
//	else if(FLASH_FREEZE_EXIT_OPCODE == opcode)
//	{
//	}
//}
void delay(int num){
	while(num>0){
		num--;
	}
}

void init_memory(){

	//INITIALIZE MEMORY 1 WITH ONES
	uint32_t *ddr_data=0;
	ddr_data=(uint32_t *)(BASE_ADDR_0 + (addr_t) FULL_MEMORY  +(addr_t)FIRST_ADDR);
	for(int i=0; i<32;i++){
		HW_set_32bit_reg((addr_t)ddr_data,(uint32_t)0xFF);//Data only ones->d"255"
		ddr_data++;
	}
}
void write_memoria01(){
	//ESCRITURA DE OTROS VALORES EN LA PRIMERA MEMORIA
	uint32_t *ddr_data=0;
	ddr_data=(uint32_t *)(BASE_ADDR_0 +(addr_t) MEMORY_1 +  (addr_t) FIRST_ADDR);
		for(int i=0; i<32;i++){
			HW_set_32bit_reg((addr_t)ddr_data,(uint32_t)0x00);//Data only ceros->d"0"
			ddr_data++;
		}
}
void read_memoria01(){
	uint32_t *ddr_data=0;
	uint32_t PRDATA[32];
	ddr_data=(uint32_t *)(BASE_ADDR_0 + (addr_t) MEMORY_1 +(addr_t)FIRST_ADDR);
	for(int i=0; i<32;i++){
		PRDATA[i]=HW_get_32bit_reg((addr_t)ddr_data);
		ddr_data++;
	}
}

void read_from_TMR(){
//	uint32_t PRDATA[3]={0,0,0};
//	PRDATA[0]=HW_get_32bit_reg((BASE_ADDR_0 +(addr_t) MEMORY_1 + (addr_t)FIRST_ADDR));//240
//	PRDATA[1]=HW_get_32bit_reg((BASE_ADDR_0 +(addr_t) MEMORY_2 + (addr_t)FIRST_ADDR));//160
//	PRDATA[2]=HW_get_32bit_reg((BASE_ADDR_0 +(addr_t) MEMORY_3 + (addr_t)FIRST_ADDR));//176
////	PRDATA[0]=HW_get_32bit_reg((BASE_ADDR_0 +(addr_t) MEMORY_1 + (addr_t)FIRST_ADDR));//240

	uint32_t *ddr_data=0;
	uint32_t PRDATA[32];
	//ddr_data=(uint32_t *)(BASE_ADDR_0 + (addr_t) MEMORY_1 +(addr_t)FIRST_ADDR);
	ddr_data=(uint32_t *)(BASE_ADDR_0 + (addr_t) FULL_MEMORY +(addr_t)FIRST_ADDR);
	for(int i=0; i<32;i++){
		PRDATA[i]=HW_get_32bit_reg((addr_t)ddr_data);
		ddr_data++;
	}
}
