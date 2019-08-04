#******************************************************************************
# Copyright (C) 2017 by Alex Fosdick - University of Colorado
#
# Redistribution, modification or use of this software in source or binary
# forms is permitted as long as the files maintain this copyright. Users are 
# permitted to modify this and use it to learn about the field of embedded
# software. Alex Fosdick and the University of Colorado are not liable for any
# misuse of this material. 
#
#*****************************************************************************

#------------------------------------------------------------------------------
# <Put a Description Here>
#
# Use: make [TARGET] [PLATFORM-OVERRIDES]
#
# Build Targets:
#      <Put a description of the supported targets here>
#
# Platform Overrides:
#      <Put a description of the supported Overrides here
#
#------------------------------------------------------------------------------
include sources.mk

# Platform Overrides to provide a default 
PLATFORM = HOST 
TARGET = c1m2
CFLAGS = -Wall -Werror -g -O0 -std=c99

# use for Ubuntu Linux on x86 default as HOST
ifeq ($(PLATFORM),HOST)
	CC = gcc
	CPPFLAGS = -DHOST $(INCLUDES)
	LDFLAGS = -Wl,-Map=$(TARGET).map
	SIZE = size
endif

# use for ARM processor on MSP board
ifeq ($(PLATFORM),MSP432)
	CC = arm-none-eabi-gcc
	CPPFLAGS = -DMSP432 $(INCLUDES)
	LINKER_FILE = -T msp432p401r.lds
	CPU = cortex-m4
	ARCH = armv7e-m
	SPECS = nosys.specs
	ARM_FLAGS = -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16
endif
# Architectures Specific Flags
# LINKER_FILE = ../msp432p401r.lds 
# CPU = 
# ARCH = 
# SPECS = 

# Compiler Flags and Defines
CC = 
LD = 
LDFLAGS = 
CFLAGS = 
CPPFLAGs = 


# 
# all:	



# %.o:	%.c
# 	gcc -DHOST -c $*.c $(INCLUDES)


list:
	@echo	$(shell ls)
	@echo	$(SOURCES)
	@echo	$(INCLUDES)

# main.o:	main.c
#	gcc -DHOST -c main.c $(INCLUDES)


clean:
	@echo "cleaning .. "
#	@echo $(SOURCES)
#	@echo $(INCLUDES)
	rm -rf *.o
	rm -rf *.d

