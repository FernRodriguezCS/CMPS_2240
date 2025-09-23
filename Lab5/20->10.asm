.data
output: .asciiz "Subtraction of number from 20 - 10:\n"

.text
.globl main
main:
    # print header
    li   $v0, 4
    la   $a0, output
    syscall

    li   $t0, 40        # running total (we'll first subtract 20 -> becomes 20)
    li   $t5, 20        # i = 20

loop:
    sub  $t0, $t0, $t5  # total -= i
    addi $t5, $t5, -1   # i--

    bge  $t5, 10, loop  # keep going while i >= 10

end:
    move $a0, $t0       # print result
    li   $v0, 1
    syscall

    li   $v0, 10        # exit
    syscall