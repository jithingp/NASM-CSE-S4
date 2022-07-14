.data
    msg1:  .asciiz "Enter first number : "
    msg2: .asciiz "Enter second number : "
    msg3: .asciiz "Yes, they are twin prime  "
    msg4: .asciiz "No, they are not twin prime  "
    msg5:   .asciiz "this\n"
    newline: .asciiz "\n"
    
.globl main
.text
main :
    li $v0, 4 
    la $a0, msg1
    syscall

    li $v0, 5
    syscall

    add $t0,$zero,$v0

    li $v0, 4 
    la $a0, msg2
    syscall

    li $v0, 5
    syscall

    add $t1,$zero,$v0

    addi $t3,$t1,2
    beq $t3,$t0, next
    addi $t3,$t0,2
    beq $t3,$t1,next



    j print_no



next:
  
    addi $t9,$t0,0
    move $a0,$t9
    j checkprime
    pluto:
    addi $t9,$t1,0
    move $a0,$t9
    j checkprime1
    pluto1:
    li $v0, 4 
    la $a0, msg3
    syscall

    j exitt

checkprime:
    addi $t8,$zero,2
    iterate:
    beq $a0,$t8,pluto
    div $a0,$t8
    mfhi $t4
    addi $t3,$zero,0
    slti $t3,$t4,1
    beq $t3,$zero, continue
    j print_no
    continue:
    addi $t8,1
    j iterate




checkprime1:
    addi $t8,$zero,2
    iterate1:
    beq $a0,$t8,pluto1
    div $a0,$t8
    mfhi $t4
    addi $t3,$zero,0
    slti $t3,$t4,1
    beq $t3,$zero, continue1
    j print_no

continue1:
    addi $t8,1
    j iterate1
  


print_no:
    li $v0, 4 
    la $a0, msg4
    syscall 

exitt:
    
    li $v0,10       
    syscall
