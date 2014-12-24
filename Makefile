CFLAGS=-Wall -g

all: demo max

demo: demo.S
	as -gstabs --32 -o demo.o demo.S
	ld -m elf_i386 -o demo demo.o
clean:
	rm *.o demo max
