section .data
msg: db "enter the number:"
m1: equ $-msg
ans1: db "yes, its prime",10
a1: equ $-ans1
ans2: db "no",10
a2: equ $-ans2
count: db 2





section .bss
num: resb 1
lim: resb 1
junk: resb 1




section .text

global _start
_start:


mov eax,4
mov ebx,1
mov ecx,msg
mov edx,m1
int 80h


mov eax,3
mov ebx,0
mov ecx,num
mov edx,1
int 80h

sub byte[num],30h


mov eax,3
mov ebx,0
mov ecx,junk
mov edx,1
int 80h


if:
cmp byte[num],2
je pos

for:

mov al,byte[num]
mov ah,0

mov bl,byte[count]
mov bh,0
div bl


cmp ah,0
je neg

inc byte[count]
mov bl,byte[count]
cmp bl,byte[num]
jne for 

pos:
mov eax,4
mov ebx,1
mov ecx,ans1
mov edx,a1
int 80h
jmp exit


neg:
mov eax,4
mov ebx,1
mov ecx,ans2
mov edx,a2
int 80h


exit:
mov eax,1
mov ebx,0
int 80h