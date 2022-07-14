section .data
msg: db "Enter a number:",10
l: equ $-msg
msg1: db "number is even",10
l1: equ $-msg1

msg2: db "number is odd",10
nwl: db 10
total: db 0
digit: db 0

l2: equ $-msg2





section .bss

num: resb 2



section .text

global _start

_start:

mov eax,4
mov ebx,1
mov ecx,msg
mov edx,l
int 80h

for:

mov eax,3
mov ebx,0
mov ecx,num
mov edx,2
int 80h

mov dx,word[num]
cmp dx,word[nwl]
je check

sub word[num],30h


mov al,byte[total]
mov bl,10
mul bl
add al,byte[num]

mov byte[total],al

jmp for

check:
mov al,byte[total]
mov ah,0
mov bl,2
div bl

cmp ah,0
jne else

mov eax,4
mov ebx,1
mov ecx,msg1
mov edx,l1
int 80h
jmp exit

else:

mov eax,4
mov ebx,1
mov ecx,msg2
mov edx,l2
int 80h
jmp exit







exit:

mov eax,1
mov ebx,0
int 80h