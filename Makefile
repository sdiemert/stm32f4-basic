TARGET=main

CC=arm-none-eabi-gcc
LD=arm-none-eabi-gcc
AR=arm-none-eabi-ar
AS=arm-none-eabi-as
CP=arm-none-eabi-objcopy
OD=arm-none-eabi-objdump
SE=arm-none-eabi-size
SF=st-flash

CFLAGS = -std=gnu99 -g -O2 -Wall
CFLAGS += -mlittle-endian -mthumb -mcpu=cortex-m4
CFLAGS += --specs=nosys.specs 

SRCS = main.c

.PHONY: $(TARGET)

$(TARGET): $(TARGET).elf

$(TARGET).elf: $(SRCS)
	$(CC) $(INCLUDE) $(CFLAGS) $^ -o $@
	$(CP) -O binary $(TARGET).elf $(TARGET).bin


clean:
	rm -f *.o $(TARGET).elf $(TARGET).bin


flash:
	$(SF) write $(TARGET).bin 0x8000000
