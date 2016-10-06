include ../defs.mak

ifndef STM32F1
  $(error vaara prosessori valittuna)
endif  
  
#prefix = /home/timo/arm
#includes = -I$(prefix)/startup -I$(prefix)/peripheral
#cobjects := $(patsubst %.c,%.o,$(wildcard *.c)) 
#asmobjects := $(patsubst %.S,%.o,$(wildcard *.S)) 
#objects = $(cobjects) $(asmobjects)


all: $(objects)
	echo $(objects)
	mv startup_stm32f10x_cl.o startup.o
	
	arm-unknown-elf-ar r libstartup.a *.o

include ../rules.mak 
 
#%.s:  %.c
#	 gcc -b arm-unknown-elf -E -H -fdirectives-only $(includes) $< -o $@e
#	 gcc -b arm-unknown-elf -mcpu=cortex-m3 -mthumb -O2 -S $(includes) $<

#$(cobjects): %.o:  %.s
#	 arm-unknown-elf-as -mcpu=cortex-m3 -a=$@.l $< -o $@ 

#$(asmobjects): %.o:  %.S
#	 arm-unknown-elf-as -mcpu=cortex-m3 -a=$@.l $< -o $@ 

#clean:
#	 rm -f *.o *.se *.l *~ *.s *.a