.data

msg:    .asciiz "Hello World\n"

.text
        .globl  main
main:
    li      $v0,    4           # syscall 4 (print_str)
    la      $a0,    msg         #argument: string
    syscall

    li      $t0,    4
    li      $t1,    5
    add     $a0,    $t0,    $t1
    li      $v0,    1
    syscall

    li      $v0,    10          # syscall to exit code
    syscall

