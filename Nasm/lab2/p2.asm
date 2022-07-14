;program to read a 2 digit number and finf its square
section .data
msg1 : db 'Enter first digit of the number :'
l1 : equ $-msg1
msg2 : db 'Enter second digit of the number :'
l2 : equ $-msg2
msg3 : db ' ', 10
l3 : equ $-msg3

section .bss
d1 : resb 1
d2 : resb 1
junk : resb 1
n1 : resw 1
n2 : resw 1
ans0 : resb 1
ans1 : resb 1
ans2 : resb 1
ans3 : resb 1
ans4 : resw 1
ans5 : resw 1

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

	;First number calculation

	
	mov al, byte[d1]
	sub al, 30h
	mov bl, 10
	mov ah, 0
	mul bl
	mov bx, word[d2]
	sub bx, 30h
	add ax, bx
	mov word[n1], ax
    ;mov word[n2], ax

    mov bl, byte[n1]
    mul bl

    ;seperating the digits
    mov bl, 100
    ;mov ah, 0
    div bl
	mov bh, ah
	movzx ax, al
	mov bl, 10
	div bl
	add ah, 30h
	add al, 30h
    mov byte[ans0], al
    mov byte[ans1], ah

    movzx ax, bh
	mov bl, 10
	;mov ah, 0
	div bl
	add al, 30h
	add ah, 30h
	mov byte[ans2], al
	mov byte[ans3], ah

	

    mov eax, 4
	mov ebx, 1
	mov ecx, ans0
	mov edx, 1
	int 80h

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

    mov eax, 4
	mov ebx, 1
	mov ecx, ans3
	mov edx, 1
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, msg3
	mov edx, l3
	int 80h

	mov eax, 1
	mov ebx, 0
	int 80h
