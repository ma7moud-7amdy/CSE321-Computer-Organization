# Task 1: Write an assembly language program using MIPS architecture 
# to enter four integers from user and determine and display the average of four numbers. 
# Program should include prompt message for user inputs and appropriate message for displayed result.

.data
numPrompt1: .asciiz "Enter the first number: "
numPrompt2: .asciiz "Enter the second number: "
numPrompt3: .asciiz "Enter the third number: "
numPrompt4: .asciiz "Enter the fourth number: "
resultPrompt: .asciiz "the Average is: "
newline: .asciiz "\n"
.text

main:

    move $t0 , $zero

    # read first number
    li $v0 4
    la $a0 numPrompt1
    syscall

    li $v0 5
    syscall
    addu $t0 , $t0 , $v0

    # read second number
    li $v0 4
    la $a0 numPrompt2
    syscall

    li $v0 5
    syscall
    addu $t0 , $t0 , $v0

    # read third number
    li $v0 4
    la $a0 numPrompt3
    syscall

    li $v0 5
    syscall
    addu $t0 , $t0 , $v0

    # read fourth number
    li $v0 4
    la $a0 numPrompt4
    syscall

    li $v0 5
    syscall
    addu $t0 , $t0 , $v0

    # add n to register t1
    li $t1 , 4
    # calculate average
    div $t0 , $t1 
    # print result prompt
    li $v0 4
    la $a0 resultPrompt
    syscall

    # print number
    li $v0 1
    mflo $a0
    syscall

    #print new line
    li $v0 4
    la $a0 newline
    syscall

exit:
    li $v0 10
    syscall