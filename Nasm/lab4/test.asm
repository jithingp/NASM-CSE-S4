section .data
msg2: db "Enter the string :"
m2: equ $-msg2
msg: db "The string is :"
m1: equ $-msg
newline: db '', 10


section .bss
string: resb 50
temp: resb 1
string_len: resb 1

section .text

global _start
_start:
    mov byte[string_len], 0
    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, m2
    int 80h

    call read_array

    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, m1
    int 80h

    call print_array

    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 80h



    mov eax,1
    mov ebx,0
    int 80h



read_array:
pusha
mov ebx, string
reading:
push ebx
mov eax, 3
mov ebx, 0
mov ecx, temp
mov edx, 1
int 80h
pop ebx
cmp byte[temp], 10 ;; check if the input is ’Enter’
je end_reading
inc byte[string_len]
mov al,byte[temp]
mov byte[ebx], al
inc ebx
jmp reading
end_reading:
;; Similar to putting a null character at the end of a string
mov byte[ebx], 0
mov ebx, string
popa
ret



print_array:
pusha
mov ebx, string
printing:
mov al, byte[ebx]
mov byte[temp], al
cmp byte[temp], 0 ;; checks if the character is NULL character
je end_printing
push ebx
mov eax, 4
mov ebx, 1
mov ecx, temp
mov edx, 1
int 80h
pop ebx
inc ebx
jmp printing
end_printing:
popa
ret