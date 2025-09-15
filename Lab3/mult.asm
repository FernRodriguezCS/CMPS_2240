.data
Number1: .asciiz "Please enter the 1st number: "
Number2: .asciiz "Please enter the 2nd number: "
Result:  .asciiz "The Result of the Product = "
High:    .asciiz "\nContents of Register HI= "
Low:     .asciiz "\nContents of Register LO= "
lf:      .asciiz "\n"

.text
.globl main
main:
    # First number
    li $v0, 4
    la $a0, Number1
    syscall
    li $v0, 5
    syscall
    move $t0, $v0

    # Second number
    li $v0, 4
    la $a0, Number2
    syscall
    li $v0, 5
    syscall
    move $t1, $v0

    # Multiply
    mult $t0, $t1

    # Print result
    li $v0, 4
    la $a0, Result
    syscall
    li $v0, 1
    mflo $a0
    syscall

    # Print HI
    li $v0, 4
    la $a0, High
    syscall
    li $v0, 1
    mfhi $a0
    syscall

    # Print LO
    li $v0, 4
    la $a0, Low
    syscall
    li $v0, 1
    mflo $a0
    syscall

    # Exit
    li $v0, 10
    syscall