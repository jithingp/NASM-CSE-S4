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
	movzx ax, al
    ;mov word[n1], ax


    mov bl, 2
    div bl
	mov bh, al
    mov byte[q1], al
    
	;movzx ax, al
    mov ax, word[q1]
    mov bl, 10
    div bl
    add al, 30h
    add ah, 30h
    mov byte[ans1], al
    mov byte[ans2], ah


    mov eax, 4
	mov ebx, 1
	mov ecx, ans1
	mov edx, 1
	int 80h

    mov eax, 4
	mov ebx, 1
	mov ecx, ans2
	mov edx, 1
	int 80h

    mov eax, 1
	mov ebx, 0
	int 80h        
