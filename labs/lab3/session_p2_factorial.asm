.data 
prompt1: .asciiz"enter number: "
resultprom: .asciiz "Factorial is: "

.text
# fact(){
#     for(i=1 ; i<= n ; i++){
#         result = result * 1
#         }
#     return result
#     }
fac_func:
    move $t0 , $a0
    addi $t1 , $zero ,1
    addi $t2 , $zero ,1

for:
    bgt $t1 , $t0 , endfor
    mul $t2 , $t2 , $t1
    addi $t1 , $t1 , 1
    j for

endfor:
    move $v0 , $t2
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
jal fac_func

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
