section .data
msg1 : db 'Sum = '
l1 : equ $-msg1
msg2 : db 'Result = '
l2 : equ $-msg2
msg5 : db ' ', 10
l5 : equ $-msg5

section .bss
d1 : resb 1
d2 : resb 1
junk : resb 1
n1 : resb 1
q1 : resb 1
sum : resb 1
ans1 : resb 1
ans2 : resb 1
ans3 : resb 1
roll : resb 1

section .text
	global _start:
	_start:
	

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

   

	mov eax, 3
	mov ebx, 0
	mov ecx, d2
	mov edx, 1
	int 80h

    mov byte[sum], 0
    sub byte[d1], 30h
    sub byte[d2], 30h

    mov bh, byte[d1]
    cmp bh, byte[d2]
    jna iff

    mov bl, byte[d2]
    mov byte[d1], bl
    mov byte[d2], bh

    iff:
        add byte[d1], 1
        sub byte[d2], 2

    for:
        mov al, byte[d1]
        add byte[sum], al
        add byte[d1], 1
        cmp al, byte[d2]
        jna for

    mov ax, word[sum]
    mov cx, word[sum]
    mov bl, 10
    div bl
    add al, 30h
    add ah, 30h
    mov byte[ans1], al
    mov byte[ans2], ah

    mov ax, cx
    mov bl, 7
    div bl

    add al, 30h
    mov byte[ans3], al

    mov eax, 4
	mov ebx, 1
	mov ecx, msg1
	mov edx, l1
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
	mov ecx, msg5
	mov edx, l5
	int 80h

    mov eax, 4
	mov ebx, 1
	mov ecx, msg2
	mov edx, l2
	int 80h


    mov eax, 4
	mov ebx, 1
	mov ecx, ans3
	mov edx, 1
	int 80h

    mov eax, 4
	mov ebx, 1
	mov ecx, msg5
	mov edx, l5
	int 80h

    mov eax, 1
	mov ebx, 0
	int 80h      

