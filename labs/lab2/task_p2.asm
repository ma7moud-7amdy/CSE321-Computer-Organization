# Task 2: Write an assembly language program using MIPS architecture 
# to enter n integers from user and determine and display the average of n numbers 
# where number of integer n is entered by user. 
# Program should include prompt message for user inputs and appropriate message for displayed result.

.data
prompt_n: .asciiz "Enter number of integers n: "
prompt_num: .asciiz "Enter integer: "
result: .asciiz "Average = "
newline: .asciiz "\n"

.text

main:

    # enter n 
    li $v0, 4
    la $a0, prompt_n
    syscall

    li $v0, 5
    syscall
    move $t0, $v0 # t0 = n

    li $t1, 0
    move $t2 , $t0 # t2 = n also 

loop:
    beq $t0, $zero, endloop

    li $v0, 4
    la $a0, prompt_num
    syscall

    # read integer
    li $v0, 5
    syscall
    add $t1, $t1, $v0

    addi $t0, $t0, -1
    j loop


endloop:

    li $v0, 4
    la $a0, result
    syscall

    #calculate average

    div $t1, $t2

    # Print average
    li $v0, 1
    mflo $a0
    syscall

    li $v0, 4
    la $a0, newline
    syscall

exit:
    li $v0, 10
    syscall