
%include 'in_out.asm'
	SECTION .data
	SECTION .bss
	x: RESB 80
	SECTION .text
	GLOBAL _start
	_start:
	mov eax, msg
	call sprint

	mov ecx, x
	mov edx, 10
	call sread

	mov eax, x
	call atoi
	mov [x], eax

	sub eax, 1          ; eax = x - 1

	imul eax            ; eax = (x-1) * (x-1)

	mov ebx, 5          ; ebx = 5
	imul ebx            ; eax = 5 * (x-1)^2

	mov [result], eax

	mov eax, rem
	call sprint

	mov eax, [result]
	call iprintLF

	call quit
