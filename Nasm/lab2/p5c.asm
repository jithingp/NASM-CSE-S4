; read a even 2 digit number and how many times it is divisible by 2

section .data
msg1 : db 'Enter first digit :'
l1 : equ $-msg1
msg2 : db 'Enter second digit :'
l2 : equ $-msg2

section .bss
d1 : resb 1
d2 : resb 1
junk : resb 1
n1 : resb 1
q1 : resb 1
ans1 : resb 1
ans2 : resb 1

section .text
	global _start:
	_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg1
	mov edx, l1
	int 80h

	mov eax, 3
	mov ebx, 0
	mov ecx, d1
	mov edx, 1
	int 80h

    mov eax, 3
	mov ebx, 0
	mov ecx, junk
	mov edx, 1
	int 80h

    mov eax, 4
	mov ebx, 1
	mov ecx, msg2
	mov edx, l2
	int 80h

	mov eax, 3
	mov ebx, 0
	mov ecx, d2
	mov edx, 1
	int 80h

    mov ax, word[d1]
	sub ax, 30h
	mov bl, 10
	;mov ah, 0
	mul bl
	mov bx, word[d2]
	sub bx, 30h
	add ax, bx
	
    mov byte[n1], 0

    for:
        movzx ax, al
        ;shr ax, 1
        add byte[n1], 1
        mov bl, 2
        div bl
        cmp ah, 0
        je for

    sub byte[n1], 1
    add byte[n1], 30h


    mov eax, 4
	mov ebx, 1
	mov ecx, n1
	mov edx, 1
	int 80h

    mov eax, 1
	mov ebx, 0
	int 80h 