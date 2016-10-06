include ../defs.mak

ifndef STM32F1
  $(error vaara prosessori valittuna)
endif  

all:  $(objects)
	    arm-unknown-elf-ar svr libperipheral.a *.o
     
include ../rules.mak