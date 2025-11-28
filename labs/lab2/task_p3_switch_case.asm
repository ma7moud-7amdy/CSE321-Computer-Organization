.data
prompt: .asciiz "enter number: "
msg1: .asciiz "you selected 1\n"
msg2: .asciiz "you selected 2\n"
msg3: .asciiz "you selected 3\n"
msgdefault: .asciiz "wrong!\n"

.text

main:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $t0, $v0


    li $t1, 1
    beq $t0, $t1, case1

    li $t1, 2
    beq $t0, $t1, case2

    li $t1, 3
    beq $t0, $t1, case3

    # default case
    j default

case1:
    li $v0, 4
    la $a0, msg1
    syscall
    j end

case2:
    li $v0, 4
    la $a0, msg2
    syscall
    j end

case3:
    li $v0, 4
    la $a0, msg3
    syscall
    j end

default:
    li $v0, 4
    la $a0, msgdefault
    syscall

end:
    li $v0, 10
    syscall
