	section .bss
	digit0: resb 1
	digit1: resb 1
    digit2: resb 1
    digit3: resb 1
	array: resb 50 ;Array to store 50 elements of 1 byte each.
	element: resb 1
	num: resb 1
    lar: resb 1
	temp: resb 1
	ele: resb 1
	junk: resb 1

    section .data

	msg2: db "Enter a number:"
	size2: equ $-msg2
    msg3: db "Largest Number : "
    l3 : equ $-msg3
    msg4: db "Smallest Number : "
    l4 : equ $-msg4
    msg5 : db ' ', 10
    l5 : equ $-msg5


    section .text
	global _start
	_start:

    mov byte[num], 10
    ;sub byte[num], 30h
    ;mov ax, word[num] 
    ;mov bl, 10
    ;mul bl

    ;mov word[num], ax
    mov al, byte[num]

    mov byte[temp], al
	mov ebx, array
    mov byte[lar], 0

    	reading:
	push ebx ;Preserving The value of ebx in stack
	;Printing the message to enter each element
	mov eax, 4
	mov ebx, 1
	mov ecx, msg2
	mov edx, size2
	int 80h
	;Reading the number
	mov eax, 3
	mov ebx, 0
	mov ecx, digit1
	mov edx, 1
	int 80h
	mov eax, 3
	mov ebx, 0
	mov ecx, digit0
	mov edx, 1
	int 80h
	mov eax,3
	mov ebx,0
	mov ecx,junk
	mov edx,1
	int 80h
	sub byte[digit1], 30h
	sub byte[digit0], 30h
	mov al, byte[digit1]
	mov dl, 10
	mul dl
    mov byte[num], al
	mov al, byte[digit0]
    add byte[num],al
    mov al, byte[num]
	;al now contains the number

	pop ebx
	mov byte[ebx], al
    mov al, byte[ebx]
    mov ah, byte[lar]
	cmp al, ah
    jl notlarger
    mov byte[lar], al
    notlarger:
	add ebx, 1

	dec byte[temp]
	cmp byte[temp], 0
	jg reading



   

    mov al, byte[lar]

	mov bl, 10
    mov ah, 0
	div bl
	mov byte[digit1], al
	mov byte[digit0], ah
	add byte[digit0], 30h
	add byte[digit1], 30h


    mov eax, 4
	mov ebx, 1
	mov ecx, digit1
	mov edx, 1
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, digit0
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