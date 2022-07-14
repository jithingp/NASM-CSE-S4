section .data
msg1: db "Enter the string :"
m1: equ $-msg1
msg2: db "Reverse : "
m2: equ $-msg2
newline: db '', 10

section .bss
string: resb 50
str1: resb 50
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

    call reverse_str

    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, m2
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


reverse_str:
pusha
mov ecx, str1
mov ebx, dword[end]
mov byte[count], 0
mov ah, byte[string_len]
loop_rev:
mov al,byte[ebx]
mov byte[ecx],al
inc ecx
dec ebx
inc byte[count]
cmp byte[count], ah
jl loop_rev
popa
ret


print_array:
pusha
mov ebx, str1
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