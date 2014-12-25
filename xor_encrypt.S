.section .bss
.lcomm buf, 16

.section .text

.globl _start
_start:
	movl $3, %eax
	movl $0, %ebx
	movl $buf, %ecx
	movl $16, %edx
	int $0x80
	movl $0, %esi
1:
	movb buf(,%esi,1), %al
	cmpb $0, %al
	je 1f
	xorb $0x19, %al
	movb %al, buf(,%esi,1)
	incl %esi
	cmpl $16, %esi
	jl 1b
1:
	movl $4, %eax
	movl $1, %ebx
	movl $buf, %ecx
	movl $16, %edx
	int $0x80

	movl $1, %eax

	movl $0, %ebx
	int $0x80
