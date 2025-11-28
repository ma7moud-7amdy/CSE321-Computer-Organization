.data
firstNumPrompt: .asciiz "Enter the first number: "
secondNumPrompt: .asciiz "Enter the second number: "
resultPrompt: .asciiz "the result is: "
newline: .asciiz "\n"
.text

main:
    # read first number
    li $v0 4
    la $a0 firstNumPrompt
    syscall

    li $v0 5
    syscall
    move $t0 , $v0

    # read second number
    li $v0 4
    la $a0 secondNumPrompt
    syscall

    li $v0 5
    syscall
    move $t1 , $v0

    # add two numbers
    addu $t2 ,$t0 , $t1
    # print result prompt
    li $v0 4
    la $a0 resultPrompt
    syscall

    # print number
    li $v0 1
    move $a0 , $t2
    syscall

    #print new line
    li $v0 4
    la $a0 newline
    syscall

exit:
    li $v0 10
    syscall