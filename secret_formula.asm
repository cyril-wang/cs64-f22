.data

krabby: .word 1 2 3 4 5 6 7 8 9 10

carray: .word 0:10

marray: .word 0:10

comma:      .asciiz ", "

newline:    .asciiz "\n"

.text
main:
	la $a0,krabby
	li $a1,10

	la $a2,carray
	la $a3,marray

	#fill in your loop here
	#feel free to use 2 loops if you need to

    # move arrays from argument registers
    move $s0 $a2
    move $s1 $a3
    move $s2 $a1
    move $s3 $a0

    li $s4 0

call:
    beq $s4 $s2 print
    li $a0 3 
    li $a1 11
    lw $a2 0($s3)

    jal secret_formula_apply

    sw $v0 0($s0)

    lw $a2 0($s0)

    jal secret_formula_remove

    sw $v0 0($s1)

    addiu $s0 $s0 4
    addiu $s3 $s3 4
    addiu $s1 $s1 4
    addi $s4 $s4 1

    j call

print:
    la $a0 carray
    jal printArray
    
    li $v0, 4
    la $a0, newline
    syscall

    la $a0 marray
    jal printArray

	j exit


secret_formula_apply:
#fill stuff here thanks
    li $t0 7 # e
    mult $a0 $a1
    mflo $t1 # n
    move $t2 $a2 # m 
    li $t3 1

    pow:	
        beq $t0 $0 mod
        mult $t3 $t2
        mflo $t3 
        addi $t0 $t0 -1
        j pow 

    mod:
        div $t3 $t1
        mfhi $v0

    jr $ra

secret_formula_remove:
#fill more stuff here thanks
# no problem
    li $t0 3
    mult $a0 $a1
    mflo $t1 
    move $t2 $a2
    li $t3 1    
    
    j pow

printArray:
        move $t0 $a0

        li $v0, 1

        lw $a0, 0($t0)

        syscall

        li $v0, 4

        la $a0, comma

        syscall

        

        li $v0, 1

        lw $a0, 4($t0)

        syscall

        li $v0, 4

        la $a0, comma

        syscall


        li $v0, 1

        lw $a0, 8($t0)

        syscall

        li $v0, 4

        la $a0, comma

        syscall


        li $v0, 1

        lw $a0, 12($t0)

        syscall

        li $v0, 4

        la $a0, comma

        syscall


        li $v0, 1

        lw $a0, 16($t0)

        syscall

        li $v0, 4

        la $a0, comma

        syscall


        li $v0, 1

        lw $a0, 20($t0)

        syscall

        li $v0, 4

        la $a0, comma

        syscall


        li $v0, 1

        lw $a0, 24($t0)

        syscall

        li $v0, 4

        la $a0, comma

        syscall


        li $v0, 1

        lw $a0, 28($t0)

        syscall

        li $v0, 4

        la $a0, comma

        syscall


        li $v0, 1

        lw $a0, 32($t0)

        syscall

        li $v0, 4

        la $a0, comma

        syscall

		

	li $v0, 1

        lw $a0, 36($t0)

        syscall

        jr $ra

exit:
	li $v0, 10
	syscall