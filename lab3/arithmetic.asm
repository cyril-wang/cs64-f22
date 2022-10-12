# arithmetic.asm
# A simple calculator program in MIPS Assembly for CS64
#

.text
main:

	# TODO: Write your code here
	
	# get x
	li $v0, 5
	syscall
	move $t0, $v0
	
	# get y
	li $v0, 5
	syscall
	move $t1, $v0

	# calculate x- y 
	sub $t2, $t0, $t1
	
	# multiply by 16 using bit shifting
	sll $t2, $t2, 4

	# add 8 and put in $a0
	addi $a0, $t2, 8	

	li $v0, 1
	syscall
	

exit:
	# Exit SPIM: Write your code here!
	li $v0, 10
	syscall
