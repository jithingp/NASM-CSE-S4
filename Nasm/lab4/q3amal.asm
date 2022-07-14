section .data
msg1: db 'Enter first string',10
l1: equ $-msg1
msg2: db 'Enter second string',10
l2: equ $-msg2
section .bss
str1: resb 50
str2: resb 101
temp: resb 1

section .text

global _start
_start:
mov ecx,msg1
mov edx,l1
call print_msg


mov ebx,str1
call read_str
mov ecx,msg2
mov edx,l2
call print_msg


mov ebx,str2
call read_str

mov esi,str2
mov edi,str1
call extend


mov ebx,str1
call print_str






exit:
mov eax,1
mov ebx,0
int 80h


read_str:
pusha
str_read:
push ebx
mov eax,3
mov ebx,0
mov ecx,temp
mov edx,1
int 80h
pop ebx
mov al,byte[temp]
cmp al,10
je end_read


mov byte[ebx],al
inc ebx
jmp str_read

end_read:
inc ebx
mov byte[ebx],0
popa
ret


print_msg:
pusha
mov eax,4
mov ebx,1
int 80h
popa
ret

;string 1 in edi and string 2 in esi

extend:
pusha
loop:
mov al,byte[edi]
cmp al,0
je iterate
inc edi
jmp loop

iterate:
mov al,byte[esi]
cmp al,0
je loc_store
mov byte[edi],al
inc esi
cmp esi,0
je loc_store
; inc esi
inc edi
jmp iterate


loc_store:
inc edi
mov byte[edi],0

popa
ret

print_str:
pusha
str_print:
mov al,byte[ebx]
cmp al,0
mov byte[temp],al

je end_print
push ebx
mov eax,4
mov ebx,1
mov ecx,temp
mov edx,1
int 80h
pop ebx
inc ebx
jmp str_print
  
end_print:
popa
ret