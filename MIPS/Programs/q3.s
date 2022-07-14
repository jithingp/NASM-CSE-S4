.data
    msg1:  .asciiz "Enter first string : "
    msg2: .asciiz "Enter second string : "
    msg3: .asciiz "concatenated string : "
    newline: .asciiz "\n"
    str1: .space 256
    str2: .space 256
    str3: .space 256

.globl main
.text
main :
    li $v0, 4 
    la $a0, msg1
    syscall

    li $v0, 8
    la $a0, str1
    li $a1, 256
    move $t2,$a0
    syscall
    
    li $v0, 4 
    la $a0, msg2
    syscall

    li $v0, 8
    la $a0, str2
    li $a1, 256
    move $t3,$a0
    syscall
   
    la $s1, str1
    la $s2, str2
    la $s3, str3

    copy_string1:
    lb $t0, ($s1)
    addi $t1,$zero,10
    beq $t1, $t0, copy_string2
    sb $t0, ($s3)
    addi $s1,1
    addi $s3,1
    j copy_string1

    copy_string2:
    lb $t0, ($s2)
    addi $t1,$zero,10
    beq $t1, $t0, print_msg3
    sb $t0, ($s3)
    addi $s2,1
    addi $s3,1
    j copy_string2

    print_msg3:
    li $v0, 4 
    la $a0, msg3
    syscall

    li $v0, 4 
    la $a0, str3
    syscall

    li $v0,10       
    syscall