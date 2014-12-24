.data
nums:
	.int 1,2,5,6,4,3,0

.text
.globl _start

_start:

	movl $nums, %eax
	movl %eax, %ebx
	movl (%eax), %ecx
done:	movl $1, %eax
	int $0x80
