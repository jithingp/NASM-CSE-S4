.data
    msg1:  .asciiz "Enter the string : "
    msg2: .asciiz "Enter  word 1 : "
    msg3: .asciiz "Enter word 2 : "
    newline: .asciiz "\n"
    space: .asciiz " "
    str1: .space 256
    str2: .space 256
    str3: .space 256
    str4: .space 256

.globl main
.text
main :
    li $v0, 4 
    la $a0, msg1
    syscall

    li $v0, 8
    la $a0, str1
    li $a1, 256
    move $t0,$a0
    syscall

    li $v0, 4 
    la $a0, msg2
    syscall

    li $v0, 8
    la $a0, str2
    li $a1, 256
    move $t1,$a0
    syscall


    li $v0, 4 
    la $a0, msg3
    syscall

    li $v0, 8
    la $a0, str3
    li $a1, 256
    move $t2,$a0
    syscall


    la $s0,str1
    la $s3,str4
    la $s6,space

    check:
    la $s1,str2
    addi $s2, $s0,0
    check_loop:
    lb $t9,($s1)
    lb $t8,($s2)
    addi $t1,$zero,32
    beq $t1, $t9, copy1
    beq $t1, $t8, copy1
    addi $t1,$zero,10
    beq $t1, $t9, copy1
    beq $t1, $t8, print3
    bne $t8,$t9,print_org
    addi $s1,1
    addi $s2,1
    j check_loop

    copy1:
    la $s4,str3
    copy_rep_loop:
    lb $t0, ($s4)
    addi $t1,$zero,32
    beq $t1, $t0, loop_tillspace
    addi $t1,$zero,10
    beq $t1, $t0, loop_tillspace
    sb $t0, ($s3)
    addi $s4,1
    addi $s3,1
    j copy_rep_loop


    loop_tillspace:
    lb $t0, ($s6)
    sb $t0, ($s3)
    addi $s3,1
    lb $t0, ($s2)
    addi $t1,$zero,32
    beq $t1, $t0, skip
    addi $t1,$zero,10
    beq $t1, $t0, print3

    skip:
    addi $s2,1
    addi $s0,$s2,0
    j check



    
    print_org:

    print_org_loop:
    lb $t0, ($s0)
    sb $t0, ($s3)
    addi $t1,$zero,32
    beq $t1, $t0, print
    addi $t1,$zero,10
    beq $t1, $t0, print3
    
    addi $s0,1
    addi $s3,1
    j print_org_loop

    print:
    lb $t0, ($s6)
    sb $t0, ($s3)
    addi $s3,1
    addi $s0,1

    j check

    print3:
    li $v0, 4 
    la $a0, str4
    syscall

    exitt:
    li $v0,10       
    syscall
