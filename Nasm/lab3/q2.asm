	section .bss
	digit0: resb 1
	digit1: resb 1
    digit2: resb 1
    digit3: resb 1
    ans0: resb 1
    ans1: resb 1
    ans2: resb 1
    ans3: resb 1
	array: resb 50 ;Array to store 50 elements of 1 byte each.
	element: resb 1
	num: resb 1
	sum: resw 1
	temp: resb 1
	ele: resb 1



    section .data
	msg1: db "Enter the number of elements : "
	size1: equ $-msg1
	msg2: db "Enter a number:"
	size2: equ $-msg2
    msg3: db "Even Numbers : "
    l3 : equ $-msg3
    msg4: db "Odd Numbers : "
    l4 : equ $-msg4
    msg5 : db ' ', 10
    l5 : equ $-msg5

      section .text
	global _start
	_start:
	;Printing the message to enter the number
	mov eax, 4
	mov ebx, 1
	mov ecx, msg1
	mov edx, size1
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

	mov eax, 3
	mov ebx, 0
    mov ecx, temp
	mov edx, 1
	int 80h

    sub byte[digit1], 30h
	sub byte[digit0], 30h
	mov al, byte[digit1]
	mov dl, 10
	mul dl
	mov byte[num], al
	mov al, byte[digit0]
	add byte[num], al
	mov al, byte[num]

    mov byte[temp], al
	mov ebx, array

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
	mov edx, 2
	int 80h
	sub byte[digit1], 30h
	sub byte[digit0], 30h
	mov al, byte[digit1]
	mov dl, 10
	mul dl
	add al, byte[digit0]
	;al now contains the number

    pop ebx
	mov byte[ebx], al
	add ebx, 1

	dec byte[temp]
	cmp byte[temp], 0
	jg reading

    mov word[sum], 0

    movzx ecx, byte[num]
	mov ebx, array

    searching:
	push ecx
    mov ax, 0
    mov al, byte[ebx]
    push ebx
    movzx ax, al
    add word[sum], ax
	add ebx, 1
    pop ebx
	pop ecx
	loop searching

    mov ax, word[sum]
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
	mov ecx, msg5
	mov edx, l5
	int 80h

    mov eax, 1
	mov ebx, 0
	int 80h