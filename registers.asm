section .text

	global _start
_start:
	mov edx, len	;Message length
	mov ecx, msg	;Message to write
	mov ebx,1	;File descriptor(stdout)
	mov eax,4	;system call number(sys_write)
	int 0x80	;call kernel

	mov edx,9	;Message length
	mov ecx,s2	;message to write
	mov ebx,1	;file descriptor(stdout)
	mov eax,4	;system call number(sys_write)
	int 0x80	;call kernel

	mov eax,1	;system call number(sys_exit)
	int 0x80	;call kernel

section .data
msg db 'Displaying 9 stars', 0xa ;a message
len equ $ - msg		;length of message
s2 times 9 db '*'
