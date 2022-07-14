; read a 2 digit number and print the sum of even numbers

section .data
msg1 : db 'Enter first digit :'
l1 : equ $-msg1
msg2 : db 'Enter second digit :'
l2 : equ $-msg2

section .bss
d1 : resb 1
d2 : resb 1
junk : resb 1
counter : resb 1
sum : resw 1
n1 : resb 1
ans1 : resb 1
ans2 : resb 1
ans3 : resb 1
ans4 : resb 1

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

    mov al, byte[d1]
	sub al, 30h
	mov bl, 10
	mov ah, 0
	mul bl
	mov bx, word[d2]
	sub bx, 30h
	add ax, bx
    mov word[n1], ax

    mov byte[counter], 0
    mov word[sum], 0

    for:
        
        mov al, byte[counter]
        mov ah, 0
        add word[sum], ax
        add byte[counter], 2
        mov ah, byte[counter]
        cmp ah, byte[n1]
        jna for

    ;xor edx, edx
     mov ax, word[sum]
    ; mov bl, 1000
    ; div bl
    ; add al, 30h
    ; mov byte[ans1], al

    ;mov ax, dx

    mov bl, 100
    div bl
    mov bh, ah
    ;add al, 30h
    movzx ax, al
    mov bl, 10
    div bl
    add al, 30h
    add ah, 30h
    mov byte[ans1], al
    mov byte[ans2], ah

    movzx ax, bh
    mov bl, 10
    div bl,
    add al, 30h
    mov byte[ans3], al
    add ah, 30h
    mov byte[ans4], ah


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
	mov ecx, ans4
	mov edx, 1
	int 80h


  

    mov eax, 1
	mov ebx, 0
	int 80h        
