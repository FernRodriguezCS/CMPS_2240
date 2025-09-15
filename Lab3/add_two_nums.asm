.data
msg1: .asciiz "Please enter the first number: "
msg2: .asciiz "Please enter the second number: "
msg3: .asciiz "The total sum = "
lf:   .asciiz "\n"

.text
.globl main
main:
    # First number
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    move $t0, $v0

    # Second number
    li $v0, 4
    la $a0, msg2
    syscall
    li $v0, 5
    syscall
    move $t1, $v0

    # Sum
    add $t2, $t0, $t1

    # Print result
    li $v0, 4
    la $a0, msg3
    syscall
    li $v0, 1
    move $a0, $t2
    syscall

    # Newline and exit
    li $v0, 4
    la $a0, lf
    syscall
    li $v0, 10
    syscall