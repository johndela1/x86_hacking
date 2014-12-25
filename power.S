# compare output of recursive and iterative functions
# with same input (should be equal)

.section .text

.globl _start
_start:
	push $3
	push $2
	call power
	addl $8, %esp
	pushl %eax
	push $0
	push $5
	call power
	addl $8, %esp
	popl %ebx
	addl %eax, %ebx
	pushl %ebx
	push $3
	push $2
	call ipower
	addl $8, %esp
	push %eax
	push $0
	push $5
	call ipower
	add $8, %esp
	popl %ebx
	addl %ebx, %eax
	popl %ebx
	subl %eax, %ebx
	movl $1, %eax
	int $0x80
.type power,@function
power:
	pushl %ebp
	movl %esp, %ebp
	subl $4, %esp		#local storage
	movl 8(%ebp), %ebx	#first arg
	movl 12(%ebp), %ecx	#second arg
	movl %ebx, -4(%ebp)
	cmpl $0, %ecx
	jne power_loop
	movl $1, -4(%ebp)
	jmp power_end
power_loop:
	cmpl $1, %ecx
	je power_end
	movl -4(%ebp), %eax
	imull %ebx, %eax 
	movl %eax, -4(%ebp)
	decl %ecx
	jmp power_loop
power_end:
	movl -4(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret

ipower:
	pushl %ebp
	movl %esp, %ebp
	movl 8(%ebp), %eax
	movl 12(%ebp), %ebx
	cmpl $0, %ebx
	jne 1f
	movl $1, %eax
	jmp ipower_end
1:	movl %eax, %ecx
ipower_loop:
	cmpl $1, %ebx
	je ipower_end
	imull %ecx, %eax
	decl %ebx
	jmp ipower_loop
ipower_end:
	movl %ebp, %esp
	popl %ebp
	ret
