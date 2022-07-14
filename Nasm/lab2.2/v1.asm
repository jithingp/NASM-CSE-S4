;if statement in assembly 


section .bss
bit :resb 1


section .data
msg: db "ente bit value",10
l: equ $-msg
msg1: db "bit is set",10
l1: equ $-msg1
msg2: db "bit is no set",10
l2: equ $-msg2





section .text

global _start:
_start:

mov eax,4
mov ebx,1
mov ecx,msg
mov edx,l
int 80h

mov eax,3
mov ebx,0
mov ecx,bit
mov edx,1
int 80h


mov al,byte[bit]
sub al, 30h
cmp al,1
je if
mov eax,4
mov ebx,1
mov ecx,msg2
mov edx,l2
int 80h
jmp exit


if:
mov eax,4
mov ebx,1
mov ecx,msg1
mov edx,l1
int 80h

exit:
mov eax,1
mov ebx,0
int 80h

