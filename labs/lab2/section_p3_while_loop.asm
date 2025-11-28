### Lab Exercise 3: While Loop Example

# Write a MIPS program that prints numbers from 1 to 10 using a
# **while loop** structure.

# t0 = 1
# while( t0 <= 10){
#   print(t0)
#   t0 ++
#   }

.data
    space: .asciiz " "
    newline: .asciiz "\n"
.text
main:
    addi $t0 , $zero , 1
    addi $t1 , $zero , 10

while:
    # check if  t0 <= 10 
    bgt $t0 , $t1 , endWhile

    #print $t0
    li $v0 , 1
    move $a0 , $t0
    syscall

    #print space
    li $v0 , 4
    la $a0 , space
    syscall

    addi $t0 , $t0 , 1

    j while

endWhile:
    #print newline
    li $v0 , 4
    la $a0 , newline
    syscall

exit:
    li $v0 , 10
    syscall

