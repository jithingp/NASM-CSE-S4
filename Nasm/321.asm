section .data
msg1: db 'Enter the number of elements: '
l1: equ $-msg1
msg2: db 'Enter a number: '
l2: equ $-msg2
msg3: db 'Total Sum : '
l3: equ $-msg3
mline: db '', 10

section .bss
d: resd 1
arr: resd 50
n: resd 1
sum: resd 1
num: resd 1
counter1: resd 1
n1: resd 1
count: resd 1
counter: resb 1

section .text
    global _start:
    _start:

    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, l1
    int 80h

    mov dword[sum], 0
    call read_num
    mov eax, dword[n1]
    mov dword[counter1], eax

    forloop:
    cmp dword[counter1], 0
    je exit1

        mov eax, 4
        mov ebx, 1
        mov ecx, msg2
        mov edx, l2
        int 80h

    call read_num
     mov eax, dword[n1]
     mov dword[num], eax
    
    call ifprime
    sub dword[counter1], 1
    jmp forloop



    ifprime:
        pushad
        mov dword[count], 2
        if:
        cmp dword[num],2
        je pos
        cmp dword[num],1
        je neg

        for:

        mov eax,dword[num]
        
        mov edx,0
        mov ebx,dword[count]
        div ebx


        cmp dx,0
        je neg

        inc dword[count]
        mov ebx,dword[count]
        cmp ebx,dword[num]
        jne for

        pos:
        mov ebx, dword[num]
        add dword[sum], ebx
        jmp exit2


        neg:

        exit2:
        popad
        ret


    exit1:
    mov ebx, dword[sum]
    mov dword[n1], ebx

    mov eax, 4
    mov ebx, 1
    mov ecx, msg3
    mov edx, l3
    int 80h

    call print_num

    mov eax,1
    mov ebx,0
    int 80h



    
read_num:

    pushad
    mov dword[n1], 0
    
    read:  
        mov eax, 3
        mov ebx, 0
        mov ecx, d
        mov edx, 1
        int 80h

        cmp byte[d], 10
        je read_exit

        sub byte[d], 30h
        mov eax, dword[n1]
        mov ebx, 10
        mul ebx
        mov ebx, 0
        add bl, byte[d]
        add eax, ebx
        mov dword[n1], eax
        jmp read

    read_exit:        
        popad
        ret





    print_num:
    
    pushad
    mov byte[counter], 0
    cmp dword[n1], 0
    je zero

    edkuka:
        mov eax, dword[n1]
        cmp eax, 0
        je print
        
        inc byte[counter]
        mov edx, 0
        mov ebx, 10
        div ebx
        push dx
        mov dword[n1], eax
        jmp edkuka

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
        mov ecx, mline
        mov edx, 1
        int 80h

        popad
        ret


