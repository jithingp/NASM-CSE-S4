.data
    msg1:  .asciiz "Enter the size : "
    space: .asciiz "  "

.globl main
.text
main :
    li $v0, 4 
    la $a0, msg1
    syscall

    li $v0, 5
    syscall

    move $s0,$v0

    addi $t0,$zero,0
    addi $t1,$zero,1 
    addi $s1,$zero,0

nacci_loop:
    beq $s1,$s0, exitt
    addi $s1,1

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4 
    la $a0, space
    syscall

    addi $t2,$t1,0
    add $t1,$t0,$t1
    add $t0,$t2,$zero


    j nacci_loop

    exitt:    
    li $v0,10       
    syscall    

