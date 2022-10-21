# min.asm program
#
.data

    # TODO: Complete these declarations / initializations

	enter:  .asciiz "Enter the next number:\n"
	# second: .asciiz "Second Largest: "
	newline: .asciiz "\n"
	minimum: .asciiz "Minimum:"

#Text Area (i.e. instructions)
.text

main:

    # TODO: Write your code here
    # You can have other labels expressed here, if you need to

	# get first and second numbers
	li $v0 4
	la $a0 enter
	syscall

	li $v0 5
	syscall
	move $t0 $v0

	li $v0 4
	la $a0 enter
	syscall

	li $v0 5
	syscall
	move $t1 $v0

	# check if second number is smaller
	blt $t1 $t0 second
	j third

second:
	# if so, then overwrite $t0
	move $t0 $t1

third: 
	li $v0 4
	la $a0 enter
	syscall

	li $v0 5
	syscall
	move $t2 $v0

	li $v0 4
	la $a0 minimum
	syscall

	blt $t2 $t0 return2
	
	li $v0 1
	move $a0 $t0
	syscall
	j endl

return2:
	li $v0 1
	move $a0 $t2
	syscall

endl:
	li $v0 4
	la $a0 newline
	syscall

exit:
        # TODO: Write code to properly exit a SPIM simulation
	li $v0 10
	syscall
