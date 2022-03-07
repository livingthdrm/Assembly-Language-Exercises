section .data
	hello: db 'Hello world!', 10 	; 'Hello world!' plus a linefeed character
	helloLen: equ $-hello		; Lenght of the 'Hello world!' string

section .text
	global _start

_start:
	mov eax,4		; The system call for write (sys_write)
	mov ebx,1		; File descriptor 1 - standard output
	mov ecx,hello		; Put the offset of hello in ecx
	mov edx,helloLen	; hellolen is a constant, so we don't need to say
				; mov edx, [helloLen] to get its actual value
	int 80h			; call the kernel

	mov eax, 1		; The system call for exit (sys_exit)
	mov ebx, 0		; Exit with return code of 0 (no error)
	int 80h