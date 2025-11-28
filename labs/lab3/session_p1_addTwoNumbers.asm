.data

.text

add_funct:
    # leaf function will not call any function , no need to save $ra in stack
    add $v0 , $a0 , $a1
    jr $ra

main:
    addi $sp , $sp ,-4
    sw $ra , 0($sp)

    addi $a0 , $zero ,10
    addi $a1 , $zero , 30
    jal add_funct
    move $t0 , $v0

    # print result
    li $v0 , 1
    move $a0 , $t0
    syscall

exit:
    # li $v0 , 10
    # syscall

returnMain:
    lw $ra , 0($sp)
    addi $sp , $sp , 4
    jr $ra


