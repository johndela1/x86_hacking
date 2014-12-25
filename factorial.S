.section .text

.globl _start
_start:
	pushl $4
	call fact
	addl $4, %esp
	movl %eax, %ebx
	movl $1, %eax
	int $0x80

.type fact,@function
fact:
	pushl %ebp
	movl %esp, %ebp
	movl 8(%ebp), %eax
	cmp $1, %eax
	je fact_end
	decl %eax
	push %eax
	call fact
	movl 8(%ebp), %ebx	
	imull %ebx, %eax

fact_end:
	movl %ebp, %esp
	popl %ebp
	ret

