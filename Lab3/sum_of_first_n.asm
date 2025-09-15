.data
msg1: .asciiz "Please enter the input (N)? "
msg2: .asciiz "The sum is: "
lf:   .asciiz "\n"

.text
.globl main
main:
    # prompt for N
    li $v0, 4
    la $a0, msg1
    syscall

    # read N
    li $v0, 5
    syscall
    move $t0, $v0      

    # init i=0, sum=0
    li $t1, 0
    li $t2, 0

loop:
    addi $t1, $t1, 1   # i++
    add  $t2, $t2, $t1 # sum += i
    beq  $t1, $t0, exit
    j loop

exit:
    # print message
    li $v0, 4
    la $a0, msg2
    syscall

    # print sum
    li $v0, 1
    move $a0, $t2
    syscall

    # newline and exit
    li $v0, 4
    la $a0, lf
    syscall

    li $v0, 10
    syscall