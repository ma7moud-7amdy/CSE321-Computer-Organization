.data
    nameLabel: .asciiz   "Name:    Mahmoud Hamdy Omar\n"
    idLabel: .asciiz     "ID:      26\n"
    courseLabel: .asciiz "Course:  CSE321-Computer-Organization\n"
.text
main:
    li $v0 , 4
    la $a0 , nameLabel
    syscall

    li $v0 , 4
    la $a0 , idLabel
    syscall

    li $v0 , 4  
    la $a0 , courseLabel
    syscall

    li $v0 10
    syscall
