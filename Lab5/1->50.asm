.data
output: .asciiz "Subtraction of number from 1 - 50:\n"

.text
.globl main
main:
    # print header
    li   $v0, 4
    la   $a0, output
    syscall

    # for (t0 = 1; t0 <= 50; t0++) t1 = t1 - t0;
    li   $t0, 1          # t0 = 1
    move $t1, $zero      # accumulator = 0

loop:
    sub  $t1, $t1, $t0   # t1 -= t0
    addi $t0, $t0, 1     # t0++

    blt  $t0, 51, loop   # while t0 < 51

end:
    move $a0, $t1        # print result
    li   $v0, 1
    syscall

    li   $v0, 10         # exit
    syscall