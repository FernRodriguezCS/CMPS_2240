.data
newline: .asciiz "\n"
myArray: .word 7, 23, 68, 99, 279, 455
myArrayLength: .word 6

.text
main:
    li $t0, 0          # x = 0

loop:
    la $t1, myArrayLength
    lw $t2, 0($t1)     # load array length

    slt $t3, $t0, $t2  #  x < length, t3=1
    beq $t3, $zero, end_main

    la $t4, myArray    # base address of array
    sll $t5, $t0, 2    # x * 4
    add $t6, $t5, $t4  # address of myArray[x]
    lw $t7, 0($t6)     # load myArray[x]

    li $v0, 1          # print int
    move $a0, $t7
    syscall

    li $v0, 4          # newline
    la $a0, newline
    syscall

    addi $t0, $t0, 1   # x++
    j loop

end_main:
    li $v0, 10         # exit
    syscall