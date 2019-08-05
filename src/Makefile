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

# values common to both platforms
TARGET = c1m2
FLAGS = -Wall -Werror -g -O0 -std=c99

# use for Ubuntu Linux on x86 default as HOST
ifeq ($(PLATFORM),HOST)
	CC = gcc
	SIZE = size
	CPPFLAGS = -DHOST $(INCLUDES)
	CFLAGS = $(FLAGS)
	LDFLAGS = -Wl,-Map=$(TARGET).map
endif


# use for ARM processor on MSP board
ifeq ($(PLATFORM),MSP432)
	CC = arm-none-eabi-gcc
	SIZE = arm-none-eabi-size
	CPPFLAGS = -DMSP432 $(INCLUDES)
	LINKERFILE = ../msp432p401r.lds
	LDFLAGS =  -Wl,-Map=$(TARGET).map -T $(LINKERFILE)
	CPU = cortex-m4
	ARCH = armv7e-m
	SPECS = nosys.specs
	ARM_FLAGS = -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16
	CFLAGS = $(FLAGS) $(ARM_FLAGS) -mcpu=$(CPU) -march=$(ARCH) --specs=$(SPECS)
endif

 

OBJECTS = $(SOURCES:.c=.o)
DEPENDS = $(SOURCES:.c=.d)
ASSEMBS = $(SOURCES:.c=.asm)
PREPROS = $(SOURCES:.c=.i)

# 
#
#
# the -c flag makes the compiler generate an object code file without linking
%.o : %.c
	$(CC) -c $< $(CPPFLAGS) $(CFLAGS) -o $@

# the -S flag generates assembly code files from sources
%.asm : %.c
	$(CC) -S $< $(CPPFLAGS) $(CFLAGS) -o $@

# the -E flag generates a preprocessed file
%.i : %.c
	$(CC) -E $< $(CPPFLAGS) -o $@

# flags -E -M generate dependency files
%.d : %.c
	$(CC) -E -M $< $(CPPFLAGS) -o $@

# compile-all will generate all of the object files without linking
.PHONY: compile-all
compile-all:$(OBJECTS)

.PHONY: build
build: $(S)
build: $(TARGET).out

$(TARGET).out: $(OBJECTS)
	$(CC) $(OBJECTS) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) -o $@
	$(SIZE) $@






list:
	@echo	$(shell ls)
	@echo	$(SOURCES)
	@echo	$(INCLUDES)



clean:
	@echo "cleaning .. "
#	@echo $(SOURCES)
#	@echo $(INCLUDES)
	rm -rf *.o
	rm -rf *.d
	rm -rf *.i
	rm -rf *.s
	rm -rf *.asm
	rm -rf *.map

