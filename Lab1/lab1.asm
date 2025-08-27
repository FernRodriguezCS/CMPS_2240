.data   0x10000000
.text   0x00400000
    .globl  main
main:
    addi    $8,         $0,     8       # r8 which I will call a -> we are storing 8 in it since 8 + 0 = 8
    addi    $9,         $0,     15      # r9 which I will call b -> we are storing 15 in it since 15 + 0 = 15
    # multiplication of $8 * $9 -> $10
    add     $2,         $0,     $8      # r2 is storing r8 (copy)
    add     $10,        $0,     $0      # r10 is being set to 0

mulloop:
    beq     $2,         $0,     mulexit # if r2 is equal to 0 exit
    addi    $2,         $2,     -1      # r2 -= 1 || decrement r2
    add     $10,        $10,    $9      # r10 = r10 + r9
    j       mulloop                     # jump to the top of the loop again

mulexit:
    # multiplication loop over,
    # is the result in $10 correct?
    # sll     $0,         $0,     0 this does nothing
    addi    $2,         $0,     10      # equal to li $v0 , 10 which means exit
    syscall
