.data
    msg1:  .asciiz "Enter the string : "
    msg2: .asciiz "Smallest word : "
    msg3: .asciiz "Largest word : "
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


    addi $t9,$zero,0   
    addi $t0,$zero,0   
    addi $t1,$zero,0    


    la $s1, str1
    la $t8, str1
    la $s6, str2

loop1:
    lb $t2,($s1)
    addi $t3,$zero,32
    beq $t2,$t3,frexit
    addi $t3,$zero,10
    beq $t2,$t3,brexit
    addi $t1,$t1,1
    addi $s1,$s1,1
    j loop1




frexit:
slt $t4, $t1,$t0
beqz $t4, track1
move $t1, $zero
addi $s1,$s1,1
j loop1

track1:
move $t0,$t1
sub $t8,$s1,$t1
move $t1,$zero
addi $s1,$s1,1
j loop1

brexit:
slt $t4,$t1,$t0
beqz $t4,track2
j assign

track2:
move $t0,$t1
sub $t8,$s1,$t1
move $t1,$zero
j assign


assign:
lb $t0,($t8)
addi $t1,$zero,32
beq $t0,$t1, print
addi $t1,$zero,10
beq $t0,$t1, print
sb $t0, ($s6)
addi $t8,1
addi $s6,1
j assign


print:

    li $v0, 4 
    la $a0, msg3
    syscall

    li $v0, 4 
    la $a0, str2
    syscall

    li $v0, 4 
    la $a0, newline
    syscall

    addi $t9,$zero,0    
    addi $t0,$zero,100   
    addi $t1,$zero,0    


    la $s1, str1
    la $t8, str1
    la $s6, str3


loop2:
    lb $t2,($s1)
    addi $t3,$zero,32
    beq $t2,$t3,frexit1
    addi $t3,$zero,10
    beq $t2,$t3,brexit1
    addi $t1,$t1,1
    addi $s1,$s1,1
    j loop2




frexit1:
slt $t4, $t0,$t1
beqz $t4, track11
move $t1, $zero
addi $s1,$s1,1
j loop2

track11:
move $t0,$t1
sub $t8,$s1,$t1
move $t1,$zero
addi $s1,$s1,1
j loop2

brexit1:
slt $t4,$t0,$t1
beqz $t4,track21
j assign1

track21:
move $t0,$t1
sub $t8,$s1,$t1
move $t1,$zero
j assign1


assign1:
lb $t0,($t8)
addi $t1,$zero,32
beq $t0,$t1, print1
addi $t1,$zero,10
beq $t0,$t1, print1
sb $t0, ($s6)
addi $t8,1
addi $s6,1
j assign1



print1:
    li $v0, 4 
    la $a0, msg2
    syscall
    
    li $v0, 4 
    la $a0, str3
    syscall    

    
    li $v0,10       
    syscall