.data 
prompt1: .asciiz"enter number: "
resultprom: .asciiz "Factorial is: "

.text

factorial_funct:
    # save return adress in stack
    addi $sp , $sp , -4
    sw $ra , 0($sp)
    # save parameter
    move $t0 , $a0
    # for loop
    beq $t0 , $zero , ifZero
    j else
ifZero:
    # retrun 1
    addi ,$v0 , $zero , 1
    j returnFunct
else:
    #a0 =n-1
    add $a0 , $t0 ,-1
    #save t0 in stack
    addi $sp , $sp , -4
    sw $t0 ,0($sp)

    # call fac(n-1)
    jal factorial_funct
    #get t0 from stack
    lw $t0 , 0($sp)
    addi $sp , $sp , 4

    mul $v0, $t0 , $v0
    j returnFunct

returnFunct:
lw $ra , 0($sp)
addi $sp , $sp ,4
jr $ra

main:

#save return in stack
addi $sp , $sp , -4
sw $ra , 0($sp)

#print prompt
li $v0 , 4
la $a0 , prompt1
syscall

#enter num
li $v0 , 5
syscall
move $a0 , $v0 

#function call
jal factorial_funct

move $t0 , $v0

#print result
li $v0 , 4
la $a0 , resultprom
syscall

li $v0 , 1
move $a0 ,$t0
syscall

#get return from stack 
lw $ra , 0($sp)
addi $sp , $sp , 4

jr $ra