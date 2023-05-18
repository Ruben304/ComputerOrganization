############################################################################
#                       Lab 3
#                       EC413
#
#    		Assembly Language Lab -- Programming with Loops.
#
############################################################################
#  DATA
############################################################################
        .data           # Data segment
Hello:  .asciiz " \n Hello World! \n "  # declare a zero terminated string
Hello_len: .word 16
AnInt:	.word	12		# a word initialized to 12
space:	.asciiz	" "	        # declare a zero terminate string
WordAvg:   .word 0		# use this variable for part 6
ValidInt:  .word 0		#
ValidInt2: .word 0		#
lf:     .byte	10, 0		# string with carriage return and line feed
InLenW:	.word   4       	# initialize to number of words in input1 and input2
InLenB:	.word   16      	# initialize to number of bytes in input1 and input2
        .align  4
Input1:	.word	0x01020304,0x05060708
	.word	0x090A0B0C,0x0D0E0F10
        .align  4
Input2: .word   0x01221117,0x090b1d1f   # input
        .word   0x0e1c2a08,0x06040210
        .align  4
Copy:  	.space  0x80    # space to copy input word by word
        .align  4
 
Enter: .asciiz "\n"
Comma: .asciiz ","
Empty: .space 12	# put some empty spaces here so the starting addr of Text is clear
Text: .asciiz " \n It is exciting to watch flying fish after a hard day of work. I do not know why some fish prefer flying and other fish would rather swim. It seems like the fish just woke up one day and decided, Hey, today is the day to fly away \n "	# a big string
Text_len: .word 234
msg:    .asciiz "\nThe number of f's in the text string is : \n "
msggg:    .asciiz "\nThese are the numbers between 8 and AnInt(12): \n "
msgfour:    .asciiz "\nThese are the integers values of each byte for array Input2: \n "
msgfive:    .asciiz "\nNo printing was asked in part 5 but was done  \n "
msgsix:    .asciiz "\nThis is the average in array Input1: \n "
msgseven:    .asciiz "\nThese are the first 15 integers divisable by 7 or 13: \n "
msgeight:    .asciiz "\nThese are the same integers in a 5 by 3 matrix: \n "
############################################################################
#  CODE
############################################################################
        .text                   # code segment
#
# print out greeting
#
main:
        la	$a0,Hello	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string

	
#Code for Item 2
#Count number of occurrences of letter "f" in Text string
    
        la     $t0, Text        # address of text is loaded in text
        lw     $t1, Text_len    # load length of text in t1
        li     $t2, 0
        addi   $t2,$t2,0x66     # load value of f (66) to t2
        li     $t3, 0           # count the number of f in text
        li     $t4, 0           # count the number of iterations
loop:
        bge    $t4, $t1, exit_loop
        addi    $t0, $t0, 1       # moving to the next char in text
        lb     $t5, 0($t0)        # getting the specific bit value of each acii in text 
        beq    $t5, $t2, inc      # if the index equals f then go to inc to count it
        addi    $t4, $t4, 1       # add to iteration
        j       loop 
inc: 
        addi    $t3, $t3, 1
        addi    $t4, $t4, 1
        j      loop
exit_loop: 
        
        li      $v0,4              # system call code for print_str
        la      $a0,msg            # address of string to print
        syscall                    # print the string
        xor	$a0, $a0, $a0
	add	$a0, $a0, $t3
	li	$v0, 1             # printing the value in $t3 (number of f in text)
	syscall




################################################################################
        la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string
################################################################################

#
# Code for Item 3 -- 
# Print the integer value of numbers from 8 and less than AnInt
#

        li      $v0,4              # system call code for print_str
        la      $a0,msggg            # address of string to print
        syscall                    # print the string
        
        
        li      $t0, 8       # starting from 8
        lw      $t1, AnInt   # loading the word AnInt
        xor     $a0,$a0,$a0

looploop:
        bge     $t0, $t1, exit_looploop         # stop the loop once passed or equal AnInt
        add     $a0, $a0, $t0                   # used to print the current int 
        li      $v0, 1
        syscall 
        
        xor     $a0, $a0, $a0                   # prints the space between ints
        la      $a0, space
        li      $v0, 4
        syscall

        xor     $a0, $a0, $a0                    # counts the int
        add     $t0, $t0, 1
        j       looploop 

exit_looploop:
        xor     $a0,$a0,$a0




###################################################################################
        la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string
###################################################################################
#
# Code for Item 4 -- 
# Print the integer values of each byte in the array Input2 (with spaces)
#

        li      $v0,4              # system call code for print_str
        la      $a0,msgfour            # address of string to print
        syscall                    # print the string

        li      $t4, 0          # number of iterations
        la      $t5, Input2     # load the address of array input2
        lw      $t6, InLenB     # load the length of input2
        xor     $a0, $a0, $a0

looppfour:
        bge     $t4, $t6, exit_pfour    # making sure it only iterates the length of the array times

        lb      $t7, 0($t5)             # loading the byte and printing it 
        add     $a0, $a0, $t7
        li      $v0, 1
        syscall

        xor     $a0, $a0, $a0           # printing the space between ints
        la      $a0, space
        li      $v0, 4
        syscall

        xor     $a0, $a0, $a0
        addi    $t4, $t4, 1             # increment number of iterations        
        addi    $t5, $t5, 1             # increment to next index in array 
        j       looppfour 

exit_pfour:
        xor $a0, $a0, $a0





###################################################################################
#
# Code for Item 5 -- 
# Write code to copy the contents of Input1 to Copy
#


        li      $v0,4              # system call code for print_str
        la      $a0,msgfive            # address of string to print
        syscall                    # print the string



        li      $t0, 0          # used to iterate through loop
        li      $t1, 4          # used to mark the end of array/ 16 len means 4 words
        la      $t2, Copy       # loading the address of Copy 
        la      $t3, Input1     # loading the address of Input1 array
        li      $t4, 0          # clearing the reg
looppfive:
        bge     $t0, $t1, exit_pfive    # once the end of the array is met branch out
        lw      $t4, 0($t3)             # loading the word from address t3 to t4
        sw      $t4, 0($t2)             # storing the word from reg t4 to address of t2
        addi    $t0, $t0, 1             # counting an iteration
        addi    $t3, $t3, 4             # indexing to the next word in Input2
        addi    $t2, $t2, 4             # indexing to the next address for word in Copy
exit_pfive:




#################################################################################
        la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string
###################################################################################
#
# Code for Item 6 -- 
# Print the integer average of the contents of array Input1
#



        li      $v0,4              # system call code for print_str
        la      $a0,msgsix            # address of string to print
        syscall                    # print the string


        la      $s0, Input1     # load the address of Input1
        lw      $s1, InLenB     # load the amount of words in array 
        lw      $s2, InLenB     # load the number of times need to iterrate 
        lw      $s3, WordAvg    # runnning sum for the array 
looppsix: 
        ble     $s2, $zero, exit_psix     # exit the loop once its gone through the array
        lb      $t0, ($s0)                # load the word at address t0 to t3
        add     $s3, $s3, $t0             # save the running sum
        add     $s0, $s0, 1               # index to the next word in array
        sub     $s2, $s2, 1               # count the iteration by subtracting
        j       looppsix
exit_psix:
        div $s3,$s1         # get the average word by dividing the totalsum stored in $s3 by the number of elements in Input2
        mflo $t0            # will store result of avg in $t0
        la $a0,($t0)        # load Wordavg into $a0
        li $v0,1            # system call for print_int
        syscall

        la $a0,lf          # print a new lime
        li $v0,4           # system call for print_str
        syscall            # print the string





#################################################################################
        la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string
##################################################################################
#
# Code for Item 7 -- 
# Display the first 15 integers that are divisible by either 7 and 13 (with space)
#

       
        li      $v0,4              # system call code for print_str
        la      $a0,msgseven            # address of string to print
        syscall                    # print the string      
       
       
        li      $t0, 0          # counting the number 
        li      $t1, 15         # the number of integers wanted 
        li      $t2, 0          # increament the counter
        li      $t3, 13         # set the value to check if int is div by 13
        li      $t4, 7          # set the value to check if int is div by 7

looppseven:
        bge     $t2, $t1, exit_pseven   # exit once the 15 iterations past
        div     $s2, $t0, $t4           # divide num count by 7
        mfhi    $t5
        div     $s3, $t0, $t3           # divide num count by 13
        mfhi    $t6

        beqz    $t6, dispsev            # checks if div by 13
        beqz    $t5, dispsev            # checks if div by 7

        addi    $t0, $t0, 1
        j       looppseven
dispsev:
        xor	$a0, $a0, $a0           # printing the ints in the saved num counter that meet the conditions
	add	$a0, $a0, $t0
	li	$v0, 1
	syscall
	
	xor 	$a0, $a0, $a0           # printing the space between ints
	la	$a0, space
	li	$v0, 4
	syscall
        
	addi	$t0, $t0, 1             # increment the counter 
	addi	$t2, $t2, 1             # increment the iterations 
	j	looppseven
exit_pseven:





#
# Code for Item 8 -- 
# Repeat step 7 but display the integers in 5 lines each with 3 integers (with spaces between the integers)
# This must be implemented using a nested loop.
#


        li      $v0,4              # system call code for print_str
        la      $a0,msgeight       # address of string to print
        syscall                    # print the string



        li      $s0, 0          # increment counter
        li      $s1, 0          # num counter 
        li      $t0, 13         # set the value to check if int is div by 13
        li      $t1, 7          # set the value to check if int is div by 7
        li      $t2, 5          # set the number of lines printing
        li      $t3, 3          # set the number of ints on each line 
        li      $t4, 0          
        li      $t5, 0          # outer counter
outer_loopeight:
        bge     $t5, $t2, outer_exitloop
looppeight:
        bge     $s0, $t3, exit_peight
        div     $t6, $s1, $t1           # check to see if divisble by 7
        mfhi    $s2

        div     $t7, $s1, $t0           # check to see if divisable by 13
        mfhi    $s3

        beqz    $s3, dispeight          # if it is divisable by 13 display
        beqz    $s2, dispeight          # if it is divisable by 7 display

        addi    $s1, $s1, 1             # increment num counter
        j       looppeight
dispeight:
	xor	$a0, $a0, $a0           # print the number that is divisable
	add	$a0, $a0, $s1
	li	$v0, 1
	syscall
	
	xor 	$a0, $a0, $a0           # print the spabe between ints
	la	$a0, space
	li	$v0, 4
	syscall
	
	addi	$s1, $s1, 1             # increment the number 
	addi	$s0, $s0, 1             # increament the counter
	j	looppeight              # start the loop if not done
exit_peight:
        xor     $s0, $s0, $s0           
        addi    $t5, $t5, 1             # increment the outer loop 

        la      $a0, Enter              # prints the new line 
        li      $v0, 4
        syscall

        j       outer_loopeight
outer_exitloop:
        xor     $a0, $a0, $a0

Exit:
	jr $ra
