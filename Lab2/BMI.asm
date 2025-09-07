.data
str1:   .asciiz "Enter weight (in unit pound): "
str2:   .asciiz "Enter Height (in unit inch): "
str3:   .asciiz "Your BMI is: "
errh:   .asciiz "\nError: height has to be greater than 0.\n"

.text
        .globl  main

main:
    # print first prompt
    li      $v0,    4                                           #sycall to print string
    la      $a0,    str1
    syscall
    # read and store weight
    li      $v0,    5                                           # syscall to read int
    syscall                                                     # read int is returned in $v0
    move    $t0,    $v0                                         # t0 holds pounds

    # print second prompt
    li      $v0,    4
    la      $a0,    str2
    syscall
    # read and store height
    li      $v0,    5
    syscall
    move    $t1,    $v0

    # prevent division by zero
    beq     $t1,    $zero,  bad_height

    # print out put prompt
    li      $v0,    4
    la      $a0,    str3
    syscall

    # compute BMI and output
    #BMI(US) = Weight in pounds / (Height in inches)^2 * 703
    # calculate denomenator
    mult    $t1,    $t1                                         # square height
    mflo    $t4                                                 # move lower 32 bits into t4 (denomenator)

    #calculate numerator
    li      $t2,    703
    mult    $t0,    $t2
    mflo    $t3

    # divide
    div     $t3,    $t4
    mflo    $t6

    # print to check output
    li      $v0,    1
    move    $a0,    $t6
    syscall

    li      $v0,    10                                          # syscall to exit
    syscall

bad_height:
    li      $v0,    4
    la      $a0,    errh
    syscall
    li      $v0,    10
    syscall