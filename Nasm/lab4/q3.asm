section .data
msg1: db "Enter string 1 : "
m1: equ $-msg1
msg2: db "Enter string 2 : "
m2: equ $-msg2
newline: db '', 10

section .bss
str1: resb 101
str2: resb 50
temp: resb 1
string: resb 1
end: resd 1
end1: resd 1

section .text


global _start
  _start:

mov eax, 4
mov ebx, 1
mov ecx, msg1
mov edx, m1
int 80h

mov ebx, str1
mov dword[string], ebx

call read_array
mov eax, dword[end]
mov dword[end1], eax

mov eax, 4
mov ebx, 1
mov ecx, msg2
mov edx, m2
int 80h

mov ebx, str2
mov dword[string], ebx

call read_array


call concat

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
mov ebx, dword[string]
read:
push ebx
mov eax, 3
mov ebx, 0
mov ecx, temp
mov edx, 1
int 80h

pop ebx
cmp byte[temp],10
je end_read

mov al, byte[temp]
mov byte[ebx], al
inc ebx
jmp read

end_read:
mov byte[ebx], 0
mov dword[end], ebx
mov ebx, dword[string]
popa
ret


concat:
pusha
mov ebx, dword[end1]
mov ecx, str2
cat_loop:
mov al, byte[ecx]
mov byte[ebx], al
inc ebx
inc ecx
cmp byte[ecx], 0
jne cat_loop
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


