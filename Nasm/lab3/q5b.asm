section .bss
dig1: resb 1
dig0: resb 1
junk: resb 1
num: resw 1
elenum: resb 1
array : resb 100
max :resb 1
min : resb 1
printdig1: resb 1
printdig0 : resb 1
temp : resb 1

section .data
msg1:db "enter number of elements ",10
l1:equ $-msg1
msg2:db "enter number ",10
l2:equ $-msg2
msg3:db "max number-",10
l3:equ $-msg3
msg4:db "min number-",10
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
mov ecx,dig1
mov edx,1
int 80h
mov eax,3
mov ebx,0
mov ecx,dig0
mov edx,1
int 80h
mov eax,3
mov ebx,0
mov ecx,junk
mov edx,1
int 80h
sub byte[dig1],30h
sub byte[dig0],30h
mov al,byte[dig1]
mov dl,10
mov ah,0
mul dl
mov byte[num],al
mov al,byte[dig0]
add byte[num],al
mov al,byte[num]
mov byte[temp],al
mov ebx,array
mov byte[min],99
mov byte[max],0
reading:
push ebx
mov eax,4
mov ebx,1
mov ecx,msg2
mov edx,l2
int 80h
mov eax,3
mov ebx,0
mov ecx,dig1
mov edx,1
int 80h
mov eax,3
mov ebx,0
mov ecx,dig0
mov edx,1
int 80h
mov eax,3
mov ebx,0
mov ecx,junk
mov edx,1
int 80h
sub byte[dig1],30h
sub byte[dig0],30h
mov al,byte[dig1]
mov dl,10
mov ah,0
mul dl
mov byte[num],al
mov al,byte[dig0]
add byte[num],al
mov al,byte[num]
pop ebx
mov byte[ebx],al
add ebx,1
cmp al,byte[max]
jg updatemax
cmp al,byte[min]
jl updatemin
jnl loopcheck
updatemax:
mov byte[max],al
cmp al,byte[min]
jnl loopcheck
updatemin:
mov byte[min],al


loopcheck:
dec byte[temp]
cmp byte[temp],0
jg reading

mov al,byte[max]
mov bl,10
mov ah,0
div bl
mov byte[printdig1],al
mov byte[printdig0],ah
add byte[printdig1],30h
add byte[printdig0],30h
mov eax,4
mov ebx,1
mov ecx,msg3
mov edx,l3
int 80h
mov eax,4
mov ebx,1
mov ecx,printdig1
mov edx,1
int 80h
mov eax,4
mov ebx,1
mov ecx,printdig0
mov edx,1
int 80h
mov eax,4
mov ebx,1
mov ecx,msg5
mov edx,l5
int 80h

mov al,byte[min]
mov bl,10
mov ah,0
div bl
mov byte[printdig1],al
mov byte[printdig0],ah
add byte[printdig1],30h
add byte[printdig0],30h
mov eax,4
mov ebx,1
mov ecx,msg4
mov edx,l4
int 80h
mov eax,4
mov ebx,1
mov ecx,printdig1
mov edx,1
int 80h
mov eax,4
mov ebx,1
mov ecx,printdig0
mov edx,1
int 80h

mov eax,4
mov ebx,1
mov ecx,msg5
mov edx,l5
int 80h

mov eax,1
mov ebx,0
int 80h