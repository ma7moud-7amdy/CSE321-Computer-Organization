### Lab Exercise 2: If Condition Example

# Write a MIPS assembly program that reads an integer from the user and checks
# whether it is positive, negative, or zero. Display an appropriate message
# for each case.

.data
numprompt: .asciiz "Enter the number: "
zeroPrompt: .asciiz "the number is: zero "
positivePrompt: .asciiz "the number is: positive "
negativePrompt: .asciiz "the number is: negative "
newline: .asciiz "\n"
.text

main:
    # read  number
    li $v0 4
    la $a0 numprompt
    syscall

    li $v0 5
    syscall
    move $t0 , $v0

    # write branch for each if , else if
    # else write jump
    #go to each case and handle it when end jump to endif

    beq $t0 , $zero , ifZero
    bgtz $t0 , elseifPositive
    j elseNegative

ifZero:
    li $v0 ,4
    la $a0 , zeroPrompt
    syscall
    j endIf

elseifPositive:
    li $v0 ,4
    la $a0 , positivePrompt
    syscall
    j endIf

elseNegative:
    li $v0 ,4
    la $a0 , negativePrompt
    syscall
    j endIf

endIf:
    li $v0 ,4
    la $a0 , newline
    syscall

exit:
    li $v0 , 10
    syscall