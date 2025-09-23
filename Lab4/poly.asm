# f(x) = 3x^5 + 2x^4 - 5x^3 - x^2 + 7x - 6

.data
prompt:  .asciiz "\nPlease enter value of x: "
result:  .asciiz "\nResult is: "

.text
.globl main
main:
    # ask for x
    li   $v0, 4
    la   $a0, prompt
    syscall

    li   $v0, 5       # read int
    syscall
    move $s0, $v0     # x -> $s0

    # compute f(x) in $s1
    jal  poly

    # print "Result is: "
    li   $v0, 4
    la   $a0, result
    syscall

    # print f(x)
    li   $v0, 1
    move $a0, $s1
    syscall

    # exit
    li   $v0, 10
    syscall


# poly:
#   input:  x in $s0
#   output: f(x) in $s1
poly:
    # save return address
    addiu $sp, $sp, -4
    sw    $ra, 0($sp)

    move  $t0, $s0    # t0 = x
    li    $s1, 0      # accumulator = 0

    # ---- 3x^5 ----
    li    $t2, 5      # power = 5
    jal   pow         # returns x^5 in $t3
    mul   $t3, $t3, 3 # 3 * x^5
    add   $s1, $s1, $t3

    # ---- 2x^4 ----
    li    $t2, 4
    jal   pow         # x^4 in $t3
    mul   $t3, $t3, 2 # 2 * x^4
    add   $s1, $s1, $t3

    # ---- -5x^3 ----
    li    $t2, 3
    jal   pow         # x^3 in $t3
    mul   $t3, $t3, 5 # 5 * x^3
    sub   $s1, $s1, $t3

    # ---- -x^2 ----
    li    $t2, 2
    jal   pow         # x^2 in $t3
    sub   $s1, $s1, $t3

    # ---- +7x ----
    mul   $t3, $t0, 7
    add   $s1, $s1, $t3

    # ---- -6 ----
    addi  $s1, $s1, -6

    # restore and return
    lw    $ra, 0($sp)
    addiu $sp, $sp, 4
    jr    $ra


# pow:
#   computes t3 = (t0)^t2
#   inputs:  t0 = x, t2 = power
#   output:  t3 = x^power
pow:
    li    $t1, 1      # i = 1
    li    $t3, 1      # result = 1
pow_loop:
    bgt   $t1, $t2, pow_exit
    mul   $t3, $t3, $t0
    addi  $t1, $t1, 1
    j     pow_loop
pow_exit:
    jr    $ra