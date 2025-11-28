.data

failMsg:    .asciiz "Test case failed!!\n\n"
passMsg:    .asciiz "Test case passed!!\n\n"

excpected:  .asciiz "\tExcepected =\t"
result:     .asciiz "\tResult =\t\t"

newLine:    .asciiz "\n"

test1:   .asciiz "Test fib(0)\n"
test2:   .asciiz "Test fib(1)\n"
test3:   .asciiz "Test fib(2)\n"
test4:   .asciiz "Test fib(3)\n"
test5:   .asciiz "Test fib(4)\n"
test6:   .asciiz "Test fib(5)\n"
test7:   .asciiz "Test fib(6)\n"

.text

#=====================================================
# Fibonacci Function
#   Parameters: $a0 -> n
#   Return:     $v0 -> fib(n)
#=====================================================
fib:
    li $t0 , 0 # fib(0)
    li $t1 , 1 # fib(1)
    li $t2 , 2 # i
    li $t3 , 0 # result
    bge $a0 , $t2 , else  # if n >= 2 calcualte fib
    move $v0 , $a0
    j endif

else:

    for:    bgt $t2 , $a0 , endfor  #i <= n loop
            add $t3 , $t0 , $t1
            move $t0 , $t1
            move $t1 , $t3
            addi $t2 , $t2 , 1
            j for
    endfor: 
            move $v0 , $t3

endif:
    jr $ra

main:
    addi $sp, $sp, -4
    sw   $ra, 0($sp)

    # ========= test fib(0) =========
    li $a0, 0
    jal fib

    li $a0, 0
    move $a1, $v0
    la $a2, test1
    jal assertNotEqual


    # ========= test fib(1) =========
    li $a0, 1
    jal fib

    li $a0, 1
    move $a1, $v0
    la $a2, test2
    jal assertNotEqual

    # ========= test fib(2) =========
    li $a0, 2
    jal fib

    li $a0, 1
    move $a1, $v0
    la $a2, test3
    jal assertNotEqual

    # ========= test fib(3) =========
    li $a0, 3
    jal fib

    li $a0, 2
    move $a1, $v0
    la $a2, test4
    jal assertNotEqual

    # ========= test fib(4) =========
    li $a0, 4
    jal fib

    li $a0, 3
    move $a1, $v0
    la $a2, test5
    jal assertNotEqual

    # ========= test fib(5) =========
    li $a0, 5
    jal fib

    li $a0, 5
    move $a1, $v0
    la $a2, test6
    jal assertNotEqual

    # ========= test fib(6) =========
    li $a0, 6
    jal fib

    li $a0, 8
    move $a1, $v0
    la $a2, test7
    jal assertNotEqual


    lw   $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra


#================================================================================
# assertNotEqual
#   Parameters: $a0 -> expected, $a1 -> result, $a2 -> testNumberMsg
#   Return:     ----
#================================================================================
assertNotEqual:

    move $t0, $a0
    
    li $v0, 4
    move $a0, $a2
    syscall

    la $a0, excpected
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, newLine
    syscall

    la $a0, result
    syscall

    li $v0, 1
    move $a0, $a1
    syscall

    li $v0, 4
    la $a0, newLine
    syscall

    bne $t0, $a1, printFail

    la $a0, passMsg
    syscall

    j return

printFail:
    la $a0, failMsg
    syscall

return:
    jr $ra