section .bss
num: resw 1
sum: resw 1
digit1: resb 1
digit0: resb 1
digit2: resb 1
temp: resb 1
counter:resb 1
count: resb 1
num1: resw 1
track: resb 1
flag: resb 1
array: resb 50 ;Array to store 50 elements of 1 byte each.
array1: resb 50
array2: resb 50

section .data
msg1: db "Enter the number of elements : "
size1: equ $-msg1

section .text
    global _start
    _start:
    mov byte[track],0
    mov byte[counter],0
    mov byte[sum],0
    call read_num 
    mov bx, word[num]
    mov word[num1], bx
    mov ebx, array
    mov ecx, array1

     reading:
     call read_num
     mov word[ebx], word[num]
     add ebx, 1
     mov byte[flag],0
     call check
     dec byte[num1]
     cmp byte[num1], 0
     jg reading 


    check:
    pusha
    mov al, 0
    cmp al, byte[track]
    je exit1
    

    exit1:
    popa
    ret
