; gcd amal
section .data

msg1 : db "enter first number",10
m1 : equ $ -msg1
msg2 : db "enter second number",10
m2 : equ $ -msg2


section .bss
d1: resb 1
d2: resb 1
junk: resb 1
r: resb 1


section .text
global _start:
_start:


mov eax,4
mov ebx,1
mov ecx,msg1
mov edx,m1
int 80h


mov eax,3
mov ebx,0
mov ecx,d1
mov edx,1
int 80h


mov eax,3
mov ebx,0
mov ecx,junk
mov edx,1
int 80h


mov eax,4
mov ebx,1
mov ecx,msg2
mov edx,m2
int 80h


mov eax,3
mov ebx,0
mov ecx,d2
mov edx,1
int 80h


sub byte[d1],30h
sub byte[d2],30h


for:
cmp byte[d1],0
jna exit

mov al,byte[d2]
mov ah,0
mov bl,byte[d1]

div bl

mov [r],ah
mov dl,byte[d1]
mov cl,byte[r]
mov byte[d2],dl
mov byte[d1],cl
jmp for


exit:
add byte[d2],30h

mov eax,4
mov ebx,1
mov ecx,d2
mov edx,1
int 80h

mov eax,1
mov ebx,0
int 80h