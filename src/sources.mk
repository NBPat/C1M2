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

# SOURCES and INCLUDES depend upon platform, host or ARM processor

ifeq	($(PLATFORM),HOST)
# SOURCES to use if compiling for Ubuntu Host
SOURCES =	main.c \
		memory.c 
		
# Header files for Ubuntu Host
INCLUDES =	-I../include/CMSIS \
	       -I../include/common \
       -I../include/msp432

# simple approach, if not host then MSP432 by default
else
# SOURCES and Header files to use if compiling for MSP board
SOURCES =	main.c \
		memory.c \
		startup_msp432p401r_gcc.c \
		system_msp432p401r.c \
	interrupts_msp432p401r_gcc.c

INCLUDES =	-I../include/CMSIS \
		-I../include/common \
		-I../include/msp432

endif
