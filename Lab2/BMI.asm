# INCOMPLETE change use of temporary to saved registers for weight -> dont override

.data
str1:   .asciiz "Enter weight (in unit pound): "
str2:   .asciiz "Enter Height (in unit inch): "
str3:   .asciiz "Your BMI is: "

.text
        .globl  main

main:
    # print first prompt
    li      $v0,    4                               #sycall to print string
    la      $a0,    str1
    syscall
    # read and store weight
    li      $v0,    5                               # syscall to read int
    syscall                                         # read int is returned in $v0
    move    $t0,    $v0                             # t0 holds pounds
    #print to check lbs is correct
    # li      $v0,    1
    # move    $a0,    $t0
    # syscall
    # print second prompt
    li      $v0,    4
    la      $a0,    str2
    syscall
    # read and store height
    li      $v0,    5
    syscall
    move    $t1,    $v0
    #print to check height is correct
    # li      $v0,    1
    # move    $a0,    $t1
    # syscall

    # print out put prompt
    li      $v0,    4
    la      $a0,    str3
    syscall

    # compute BMI and output
    #BMI(US) = Weight in pounds / (Height in inches)^2 * 703
    li      $t2,    703
    mult    $t1,    $t1                             # square height
    mflo    $s0                                     # move lower 32 bits into s0 (denomenator)
    # print to check multiplication
    # li $v0, 1
    # move $a0, $s0
    # syscall
    div $t0 , $s0
    mflo $s1

    mult $s1, $t2
    mflo $s3
    
    # print to check output
    li $v0, 1
    move $a0, $s3
    syscall

    li      $v0,    10                              # syscall to exit
    syscall