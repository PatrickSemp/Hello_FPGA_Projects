/*
 * config_val.h
 *
 *  Created on: Jan 4, 2024
 *      Author: Patricio
 */

#ifndef CONFIG_VAL_H_
#define CONFIG_VAL_H_

//Address for Protocol Communicate
#define BASE_ADDR_APB3             					(addr_t)(0x30000000U)
#define BASE_ADDR_SDRAM_A             				(addr_t)(0xA0000000U)//Capacity 256M
#define BASE_ADDR_SDRAM_B             				(addr_t)(0xA8000000U)
#define BASE_ADDR_SDRAM_C							(addr_t)(0xB0000000U)//Capacity 256M

//Selection for Principal Menu
#define SEL_0										0x30
#define SEL_1										0x31
#define SEL_2										0x32
#define SEL_3										0x33
#define SEL_4										0x34
#define SEL_5										0x35

//Address for Write or Read in Memory
#define FULL_MEMORY                   	    		(addr_t)(0x00000000u)//All Memory Block
#define MEMORY_1                   	    			(addr_t)(0x00000100u)//First Block of Memory
#define MEMORY_2                   	    			(addr_t)(0x00000200u)//Second Block of Memory
#define MEMORY_3                   	    			(addr_t)(0x00000300u)//Third Block of Memory



#endif /* CONFIG_VAL_H_ */
