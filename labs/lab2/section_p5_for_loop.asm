### Lab Exercise 5: For Loop Example

# Write a MIPS program that calculates the sum of the first *n* natural numbers
# using a **for loop** structure.

# enter num
# t0 = n
# t1 = 1
# for t1 <= t0
#     print t1
#     t1 ++
#     j for
# endfor 

.data 
prompt: .asciiz "enter number: "
newline: .asciiz "\n"

.text
main:
    li $v0 , 4
    la $a0 , prompt
    syscall

    li $v0 , 5
    syscall
    move $t0 , $v0

    addi $t1 , $zero , 1

for: 
    bgt $t1 , $t0 , endfor
    # print t1
    li $v0 , 1
    move $a0 , $t1
    syscall
    #print new line
    li $v0 , 4
    la , $a0 , newline
    syscall
    #t1 ++
    addi $t1 , $t1 , 1
    j for

endfor:

exit:
    li $v0 , 10
    syscall

