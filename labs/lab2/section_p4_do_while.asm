### Lab Exercise 4: Do-While Loop Example

# Write a MIPS assembly program that reads numbers from the user and sums them
# until the user enters zero. Display the final sum at the end.

.data 

numPrompt:  .asciiz "enter number: "
result: .asciiz "the sum of numbers is: "
newline : .asciiz "\n"

.text
main:
    addi $t0 , $zero , 0

dowhile:
    #read number 
    li $v0 , 4
    la $a0 , numPrompt
    syscall

    li $v0 , 5
    syscall

    move $t1 , $v0

    # check if num == 0
    beq $t1 , $zero , endwhile

    # add number to sum
    add $t0 , $t0 , $t1
    j dowhile

endwhile: 
    li $v0 , 4
    la $a0 , result
    syscall

    li $v0 , 1
    move $a0 , $t0
    syscall

    li $v0 , 4
    la $a0 , newline
    syscall

exit:
    li $v0 , 10
    syscall


