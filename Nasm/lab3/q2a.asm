section .bss
digit1: resb 1
digit0: resb 1
junk: resb 1
num: resb 1
elenum: resb 1
array : resb 100
sum :resw 1
avg0 : resb 1
avg1 : resb 1
dig1: resb 1
dig0 : resb 1
dig2 : resb 1
dig3 : resb 1
temp : resb 1


section .data
msg1:db "enter number of elements: "
l1:equ $-msg1
msg2:db "enter number: "
l2:equ $-msg2
msg3:db "sum: "
l3:equ $-msg3
msg4:db "average: "
l4:equ $-msg4
msg5:db " ",10
l5:equ $-msg5


section .text
global _start
_start:
mov eax,4
mov ebx,1
mov ecx,msg1
mov edx,l1
int 80h

mov eax,3
mov ebx,0
mov ecx,digit1
mov edx,1
int 80h

mov eax,3
mov ebx,0
mov ecx,digit0
mov edx,1
int 80h

mov eax,3
mov ebx,0
mov ecx,junk
mov edx,1
int 80h

sub byte[digit1],30h
sub byte[digit0],30h
mov al,byte[digit1]
mov dl,10
mov ah,0
mul dl
mov byte[num],al
mov al,byte[digit0]
add byte[num],al
mov al,byte[num]
mov byte[temp],al
mov al,byte[temp]
mov byte[elenum],al
mov ebx,array
mov word[sum],0

reading:
push ebx
mov eax,4
mov ebx,1
mov ecx,msg2
mov edx,l2
int 80h

mov eax,3
mov ebx,0
mov ecx,digit1
mov edx,1
int 80h

mov eax,3
mov ebx,0
mov ecx,digit0
mov edx,1
int 80h

mov eax,3
mov ebx,0
mov ecx,junk
mov edx,1
int 80h

sub byte[digit1],30h
sub byte[digit0],30h
mov al,byte[digit1]
mov dl,10
mov ah,0
mul dl
mov byte[num],al
mov al,byte[digit0]
add byte[num],al
mov al,byte[num]
pop ebx
mov byte[ebx],al
add ebx,1
movzx ax, al
add word[sum],ax

loopcheck:
dec byte[temp]
cmp byte[temp],0
jg reading

mov ax,word[sum]
mov bl,100
;mov ah,0
div bl
mov bh, ah
mov bl, 10
mov ah, 0
div bl
mov byte[dig1],al
mov byte[dig0],ah
add byte[dig1],30h
add byte[dig0],30h
mov al, bh
mov ah, 0
div bl
mov byte[dig3],al
mov byte[dig2],ah
add byte[dig3],30h
add byte[dig2],30h





mov eax,4
mov ebx,1
mov ecx,msg3
mov edx,l3
int 80h

mov eax,4
mov ebx,1
mov ecx,dig1
mov edx,1
int 80h

mov eax,4
mov ebx,1
mov ecx,dig0
mov edx,1
int 80h

mov eax,4
mov ebx,1
mov ecx,dig3
mov edx,1
int 80h

mov eax,4
mov ebx,1
mov ecx,dig2
mov edx,1
int 80h

mov eax,4
mov ebx,1
mov ecx,msg5
mov edx,l5
int 80h



mov ax, word[sum]
mov bl, byte[elenum]
div bl
mov byte[avg1], al
mov al, byte[avg1]
mov bl, 10
mov ah, 0
div bl

mov byte[dig1],al
mov byte[dig0], ah
add byte[dig1], 30h
add byte[dig0], 30h

mov eax,4
mov ebx,1
mov ecx,dig1
mov edx,1
int 80h

mov eax,4
mov ebx,1
mov ecx,dig0
mov edx,1
int 80h

mov eax,4
mov ebx,1
mov ecx,msg5
mov edx,l5
int 80h

mov eax, 1
mov ebx, 0
int 80h