# hello.asm
# A "Hello World" program in MIPS Assembly for CS64
#
#  Data Area - allocate and initialize variables
.data
	# TODO: Write your string definitions here
	input: .asciiz "Enter an integer: " 

#Text Area (i.e. instructions)
.text
main:

	# TODO: Write your code here

	# print text to ask for user input
	li $v0, 4
	la $a0, input
	syscall
	
	# get integer input
	li $v0, 5
	syscall

	# check least significant bit
	move $t0, $v0
	andi $t1, $t0, 1

	# if odd
	beq $t1, $zero, even
	li $t2, 2
	mult $t0, $t2
	mfhi $t3
	mflo $t4 
	j print

even: 
	li $t2, 3
	mult $t0, $t2
	mfhi $t3
	mflo $t4
	j print

print:
	beq $t3, $zero, low
	move $a0, $t3
	li $v0, 1
	syscall
	j low

low: 	
	move $a0, $t4
	li $v0, 1
	syscall

exit:
	# Exit SPIM: Write your code here!
	li $v0, 10
	syscall
