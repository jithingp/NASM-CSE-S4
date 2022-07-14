section .data
msg1: db "enter size of array: ", 10
l1: equ $-msg1
msg2: db "enter array elements: ", 10
l2: equ $-msg2


section .bss
num: resb 1
size2: resb 1
array1: resb 50
array2: resb 50
digit1: resb 1
digit2: resb 1
temp: resb 1
ele: resb 1


section .text
 global _start
 _start:
 ;Printing the message to enter the number
 mov eax, 4
 mov ebx, 1
 mov ecx, msg1
 mov edx, l1
 int 80h
 ;Reading the number
 mov eax, 3
 mov ebx, 0
 mov ecx, digit1
 mov edx, 1
 int 80h
 mov eax, 3
 mov ebx, 0
 mov ecx, digit2
 mov edx, 2
 int 80h
 ; mov eax, 3
 ; mov ebx, 0
 ; mov ecx, temp
 ; mov edx, 1
 ; int 80h

 sub byte[digit1], 30h
 sub byte[digit2], 30h
 mov al, byte[digit1]
 mov dl, 10
 mul dl
 mov byte[num], al
 mov al, byte[digit2]
 add byte[num], al
 mov cl, byte[num]

 mov byte[temp], al
 mov ebx, array1
 reading:
    push ecx
 push ebx ;Preserving The value of ebx in stack
 ;Printing the message to enter each element
 mov eax, 4
 mov ebx, 1
 mov ecx, msg2
 mov edx, l2
 int 80h
 ;Reading the number
 mov eax, 3
 mov ebx, 0
 mov ecx, digit1
 mov edx, 1
 int 80h
 mov eax, 3
 mov ebx, 0
 mov ecx, digit2
 mov edx, 2
 int 80h
 sub byte[digit1], 30h
 sub byte[digit2], 30h
 mov al, byte[digit1]
 mov dl, 10
 mul dl
 add al, byte[digit2]
 ;al now contains the number

 pop ebx

 mov byte[ebx], al
 add ebx, 1

    pop ecx
 dec cl
 cmp cl, 0
 jg reading


    mov eax, 4
 mov ebx, 1
 mov ecx, msg1
 mov edx, l1
 int 80h
 ;Reading the number
 mov eax, 3
 mov ebx, 0
 mov ecx, digit1
 mov edx, 1
 int 80h
 mov eax, 3
 mov ebx, 0
 mov ecx, digit2
 mov edx, 2
 int 80h
 ; mov eax, 3
 ; mov ebx, 0
 ; mov ecx, temp
 ; mov edx, 1
 ; int 80h

 sub byte[digit1], 30h
 sub byte[digit2], 30h
 mov al, byte[digit1]
 mov dl, 10
 mul dl
 mov byte[size2], al
 mov al, byte[digit2]
 add byte[size2], al
 mov cl, byte[size2]

 mov byte[temp], al
 mov ebx, array2
 reading1:
    push ecx
 push ebx ;Preserving The value of ebx in stack
 ;Printing the message to enter each element
 mov eax, 4
 mov ebx, 1
 mov ecx, msg2
 mov edx, l2
 int 80h
 ;Reading the number
 mov eax, 3
 mov ebx, 0
 mov ecx, digit1
 mov edx, 1
 int 80h
 mov eax, 3
 mov ebx, 0
 mov ecx, digit2
 mov edx, 2
 int 80h
 sub byte[digit1], 30h
 sub byte[digit2], 30h
 mov al, byte[digit1]
 mov dl, 10
 mul dl
 add al, byte[digit2]
 ;al now contains the number

 pop ebx

 mov byte[ebx], al
 add ebx, 1

    pop ecx
 dec cl
 cmp cl, 0
 jg reading1


    found:
    movzx ax, byte[ele]
 mov bl, 10
 div bl
 mov byte[digit1], al
 mov byte[digit2], ah
 add byte[digit2], 30h
 add byte[digit1], 30h
 mov eax, 4
 mov ebx, 1
 mov ecx, digit1
 mov edx, 1
 int 80h
 mov eax, 4
 mov ebx, 1
 mov ecx, digit2
 mov edx, 1
 int 80h
    jmp continue

 ;Comparing loop variable
 ;Loop using branch statements

    search:
    pusha
    mov ebx, array2
    movzx ecx, byte[size2]
    mov al , byte[ebx]
    searching:
    cmp al, byte[ele]
    je found
    continue:
    add ebx, 1
    pop ecx
    ; add byte[pos], 1
    loop searching
    popa
    ret



    mov ebx,array1
    movzx ecx,byte[num]


    traverse:
    push ecx
    mov al , byte[ebx]
    mov byte[ele], al
    call search
    ; je found
    add ebx, 1
    pop ecx
    ; add byte[pos], 1
    loop traverse

    mov eax, 1
    mov ebx, 0
    int 80h