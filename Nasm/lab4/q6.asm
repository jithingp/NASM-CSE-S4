section .data
msg1: db "Enter the string :"
m1: equ $-msg1
msg2: db "Number of spaces : "
m2: equ $-msg2
newline: db '', 10

section .bss
string: resb 50
temp: resb 1
count: resd 1
n: resd 1
counter: resb 1
d: resb 1


section .text

global _start
_start:

    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, m1
    int 80h

    call read_array

    mov eax, dword[count]
    mov dword[n], eax
    call print_num

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
mov byte[count], 0
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
cmp byte[temp], 'a'
je inc_count
cmp byte[temp], 'e'
je inc_count
cmp byte[temp], 'i'
je inc_count
cmp byte[temp], 'o'
je inc_count
cmp byte[temp], 'u'
je inc_count
jmp ll
inc_count:
inc byte[count]
ll:
mov al,byte[temp]
mov byte[ebx], al
inc ebx
jmp reading
end_reading:
;; Similar to putting a null character at the end of a string
mov byte[ebx], 0
mov ebx, string
popa
ret    

print_num:
    
    pushad
    mov byte[counter], 0
    cmp dword[n], 0
    je zero

    extract:
        mov eax, dword[n]
        cmp eax, 0
        je print
        
        inc byte[counter]
        mov edx, 0
        mov ebx, 10
        div ebx
        push dx
        mov dword[n], eax
        jmp extract

    print:

        cmp byte[counter], 0
        je print_exit

        dec byte[counter]
        pop ax
        mov byte[d], al
        add byte[d], 30h

        mov eax, 4
        mov ebx, 1
        mov ecx, d
        mov edx, 1
        int 80h
        jmp print

    zero:
        mov byte[d], 30h
        mov eax, 4
        mov ebx, 1
        mov ecx, d
        mov edx, 1
        int 80h

    
    print_exit:
        

        popad
        ret