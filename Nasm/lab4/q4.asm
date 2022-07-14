section .data
msg1: db "Enter string 1 : "
m1: equ $-msg1
msg2: db "Enter string 2 : "
m2: equ $-msg2
msg3: db "same"
m3: equ $-msg3
msg4: db "not same"
m4: equ $-msg4
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

mov eax, 4
mov ebx, 1
mov ecx, msg2
mov edx, m2
int 80h

mov ebx, str2
mov dword[string], ebx

call read_array

call comp

mov eax, 4
mov ebx, 1
mov ecx, newline
mov edx, 1
int 80h

mov eax,1
mov ebx,0
int 80h


comp:
pusha
mov ebx, str1
mov ecx, str2
cmp_loop:
mov al, byte[ebx]
cmp al, byte[ecx]
jne not_equal
inc ebx
inc ecx
cmp byte[ebx], 0
jne cmp_loop
cmp byte[ecx], 0
jne cmp_loop

mov eax, 4
mov ebx, 1
mov ecx, msg3
mov edx, m3
int 80h

jmp cmp_exit

not_equal:
mov eax, 4
mov ebx, 1
mov ecx, msg4
mov edx, m4
int 80h

cmp_exit:
popa
ret


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
mov ebx, dword[string]
popa
ret
