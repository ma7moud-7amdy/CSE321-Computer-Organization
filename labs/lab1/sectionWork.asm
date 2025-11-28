.data # data segment
str_label: .asciiz "Hello world"  # .asciiz to store ascii string and add '\0' at the end

.text
main:
    li $v0 , 4  # li: load immediate value to register  li , $reg , value
    la $a0 , str_label  #la: load adress to register  li , $reg , address
    syscall

exit:
    li $v0 10
    syscall

