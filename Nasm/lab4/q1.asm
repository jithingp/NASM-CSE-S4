section .data
msg1: db "Enter the string :"
m1: equ $-msg1
msg2: db "Yes, its a palindrome "
m2: equ $-msg2
msg3: db "No, its not a palindrome "
m3: equ $-msg3
newline: db '', 10

section .bss
string: resb 50
temp: resb 1
string_len: resb 1
end: resb 1
count: resb 1
counter: resb 1


section .text

global _start
_start:
    mov byte[string_len], 0
    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, m1
    int 80h

    call read_array

    call check_pal

    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 80h


    mov eax,1
    mov ebx,0
    int 80h


check_pal:
pusha
mov ebx, string
mov ecx, dword[end]
mov al, byte[string_len]
mov ah, 0
push ebx
mov bl, 2
div bl
mov byte[count], al
pop ebx
mov byte[counter], 0
    pal:
    mov ah, byte[ebx]
    cmp ah, byte[ecx]
    jne not_equal
    inc ebx
    dec ecx
    inc byte[counter]
    cmp byte[counter], al
    jl pal

    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, m2
    int 80h
    jmp ret_checkpal


not_equal:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg3
    mov edx, m3
    int 80h

ret_checkpal:
popa
ret


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
dec ebx
mov dword[end], ebx
mov ebx, string
popa
ret


