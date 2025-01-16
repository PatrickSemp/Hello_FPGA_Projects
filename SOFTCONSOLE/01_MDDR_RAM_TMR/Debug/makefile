################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include hal/CortexM3/GNU/subdir.mk
-include hal/CortexM3/subdir.mk
-include drivers_config/sys_config/subdir.mk
-include drivers/mss_sys_services/subdir.mk
-include drivers/mss_nvm/subdir.mk
-include drivers/mss_hpdma/subdir.mk
-include CMSIS/startup_gcc/subdir.mk
-include CMSIS/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(ASM_DEPS)),)
-include $(ASM_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
SECONDARY_FLASH += \
01_MDDR_RAM_TMR.hex \

SECONDARY_SIZE += \
01_MDDR_RAM_TMR.siz \


# All Target
all: 01_MDDR_RAM_TMR.elf secondary-outputs

# Tool invocations
01_MDDR_RAM_TMR.elf: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: Cross ARM C Linker'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -T "D:\ESPE\TESIS\SW_SOFTCONSOLE\PRUEBAS\01_MDDR_RAM_TMR\CMSIS\startup_gcc\debug-in-microsemi-smartfusion2-esram.ld" -Xlinker --gc-sections -Wl,-Map,"01_MDDR_RAM_TMR.map" --specs=nano.specs -o "01_MDDR_RAM_TMR.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

01_MDDR_RAM_TMR.hex: 01_MDDR_RAM_TMR.elf
	@echo 'Invoking: Cross ARM GNU Create Flash Image'
	arm-none-eabi-objcopy -O ihex "01_MDDR_RAM_TMR.elf"  "01_MDDR_RAM_TMR.hex"
	@echo 'Finished building: $@'
	@echo ' '

01_MDDR_RAM_TMR.siz: 01_MDDR_RAM_TMR.elf
	@echo 'Invoking: Cross ARM GNU Print Size'
	arm-none-eabi-size --format=berkeley "01_MDDR_RAM_TMR.elf"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS)$(SECONDARY_FLASH)$(SECONDARY_SIZE)$(ASM_DEPS)$(S_UPPER_DEPS)$(C_DEPS) 01_MDDR_RAM_TMR.elf
	-@echo ' '

secondary-outputs: $(SECONDARY_FLASH) $(SECONDARY_SIZE)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
