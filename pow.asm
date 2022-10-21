# pow.asm program
#

# C++ (NON-RECURSIVE) code snippet of pow(x,n):
#   int x, n, pow=1; 
#   cout << "Enter a number x:\n"; 
#   cin >> x;
#   cout << "Enter the exponent n:\n"; 
#   cin >> n; 
#   for (int i = 1; i <= n; i++) { 
#   	pow = pow * x; 
#   } 
#   cout << "Power(x,n) is:\n" << pow << "\n";
#
# Assembly (NON-RECURSIVE) code version of pow(x,n):
#
.data

	# TODO: Write your initializations here
	enter: .asciiz "Enter a number x:\n"
	exponent: .asciiz "Enter the exponent n:\n"
	power: .asciiz "Power(x,n) is:\n" 
	newline: .asciiz "\n"
#Text Area (i.e. instructions)
.text
main:
	
	# TODO: Write your code here
	# ask for x
	li $v0 4
	la $a0 enter
	syscall

	# get x from user
	li $v0 5
	syscall
	move $t0 $v0	
	
	# ask for exponent
	li $v0 4
	la $a0 exponent
	syscall
	
	# get exponent
	li $v0 5
	syscall
	move $t1 $v0
	
	# apply pow()
	li $t2 1
pow:	
	
	beq $t1 $0 print

	mult $t2 $t0
	mflo $t2 
	
	addi $t1 $t1 -1
	j pow 

print:
	li $v0 4
	la $a0 power
	syscall
	li $v0 1
	move $a0 $t2
	syscall
	li $v0 4
	la $a0 newline
	syscall

exit:
	# TODO: Write code to properly exit a SPIM simulation
	li $v0 10
	syscall
