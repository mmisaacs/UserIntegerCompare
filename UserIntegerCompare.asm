#CS2640.04

#October 20, 2023

#Write a program in Assembly that takes two numbers from a user and outputs the greater number

#1) prompt a user input
#2) assign to register
#3) compare the numbers
#4) greater number output

.data
prompt1: .asciiz "Please enter the first integer: "
prompt2: .asciiz "Please enter the second integer: "
equalNums: .asciiz "The user inputs are equal."
firstNum: .asciiz "The first user input is greater."
secondNum: .asciiz "The second user input is greater."

.text
main:
	#output the created prompt to the user to get first integer
	li $v0, 4
	la $a0, prompt1
	syscall
	
	#get user input 1
	li $v0, 5
	syscall
	move $t0, $v0
	
	#prompt the user for the second int
	li $v0, 4
	la $a0, prompt2
	syscall
	
	#get the second int
	li $v0, 5
	syscall
	move $t1, $v0
	
	#compare numbers
	beq $t0, $t1, else		#if $t0 and $t1 are equal
	bgt $t0, $t1, firstGreater 	#if $t0 is greater than $t1
	blt $t0, $t1, secondGreater	#if $t
	
else:
	#$t0 and $t1 are equal, same number
	li $v0, 4
	la $a0, equalNums
	syscall 
	
	j exit
	
firstGreater:
	#if $t0 is greater than $t1
	li $v0, 4
	la $a0, firstNum
	syscall
	
	j exit
	
secondGreater:
	#if $t1 is greater than $t0
	li $v0, 4
	la $a0, secondNum
	syscall
	
	j exit
	
exit:
	#exit syscall
	li $v0, 10
	syscall
	