section .data
msg1: db 'Enter the number of elements: ' 
l1: equ $-msg1
msg2: db 'Enter a number: ' 
l2: equ $-msg2
msg3: db 'The number of negative numbers is: '
l3: equ $-msg3
msg4: db 'The number of zeroes is: '
l4: equ $-msg4
msg5: db 'The number of positive numbers is: '
l5: equ $-msg5
newline: db '', 10
minus: db '-'

section .bss
d: resb 1
counter: resb 1
n: resd 1
negate: resb 1
n1: resd 1
arr: resd 50
neg_count: resd 1
zero_count: resd 1
i: resd 1


section .text
    global _start:
    _start:

    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, l1
    int 80h

    call read_num
    mov eax, dword[n]
    mov dword[n1], eax
    
    mov ebx, arr
    call read_arr

    mov eax, dword[n1]
    mov ebx, arr
    call solve

    mov eax, 4
    mov ebx, 1
    mov ecx, msg3
    mov edx, l3
    int 80h

    mov eax, dword[neg_count]
    mov dword[n], eax
    call print_num

    mov eax, 4
    mov ebx, 1
    mov ecx, msg4
    mov edx, l4
    int 80h

    mov eax, dword[zero_count]
    mov dword[n], eax
    call print_num

    mov eax, 4
    mov ebx, 1
    mov ecx, msg5
    mov edx, l5
    int 80h

    mov eax, dword[n1]
    sub eax, dword[neg_count]
    sub eax, dword[zero_count]
    mov dword[n], eax
    call print_num

    mov eax, 1
    mov ebx, 0
    int 80h




solve:

    mov dword[i], eax
    mov dword[neg_count], 0
    mov dword[zero_count], 0
    
    loop_i:
        cmp dword[i], 0
        je loop_i_exit

        cmp dword[ebx], 0
        je label1
        jl label2
        jmp label3

        label1:
        inc dword[zero_count]
        jmp label3

        label2:
        inc dword[neg_count]
        jmp label3

        label3:
        dec dword[i]
        add ebx, 4
        jmp loop_i

    loop_i_exit:
        ret

read_arr:
    mov dword[i], eax
    
    element_read_loop:
        push ebx
        mov eax, 4
        mov ebx, 1
        mov ecx, msg2
        mov edx, l2
        int 80h
        pop ebx
    
        call read_num
        mov ecx, dword[n]
        mov dword[ebx], ecx

    
        add ebx, 4
        dec dword[i]
        jnz element_read_loop
    
    ret




read_num:

    pushad
    mov dword[n], 0
    mov byte[negate], 0
    mov eax, 3
    mov ebx, 0
    mov ecx, d
    mov edx, 1
    int 80h

    cmp byte[d], 45
    jne non_negative
    inc byte[negate]
    jmp read

    non_negative:
        sub byte[d], 30h
        mov eax, 0
        add al, byte[d]
        add dword[n], eax

    read:  
        mov eax, 3
        mov ebx, 0
        mov ecx, d
        mov edx, 1
        int 80h

        cmp byte[d], 10
        je read_exit

        sub byte[d], 30h
        mov eax, dword[n]
        mov ebx, 10
        mul ebx
        mov ebx, 0
        add bl, byte[d]
        add eax, ebx
        mov dword[n], eax
        jmp read

    read_exit:  
        cmp byte[negate], 1
        jne read_exit_2
        neg dword[n]

    read_exit_2:      
        popad
        ret



print_num:
    
    pushad
    mov byte[counter], 0
    cmp dword[n], 0
    je zero
    jg extract

    neg dword[n]
    mov eax, 4
    mov ebx, 1
    mov ecx, minus
    mov edx, 1
    int 80h

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
        mov eax, 4
        mov ebx, 1
        mov ecx, newline
        mov edx, 1
        int 80h

        popad
        ret
