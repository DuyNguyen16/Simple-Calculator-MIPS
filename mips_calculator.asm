        .data
select1:    .asciiz "1. Addition\n"
select2:    .asciiz "2. Subtraction\n"
select3:    .asciiz "3. Multiplication\n"
select4:    .asciiz "4. Division\n"
prompt1:    .asciiz "Please select an operator: "
prompt2:    .asciiz "Enter the first integer: "
prompt3:    .asciiz "Enter the second integer: "
prompt4:    .asciiz "The result is: "
prompt5:    .asciiz "Would you like to go again? (1) Yes (2) No: "
nl:         .asciiz "\n"
        .text

main:
        li  $t8, 2      # WHILE LOOP CHECK
        li  $t7, 1      # USER INPUT TO END LOOP

while_loop:
        # BEGIN WHILE LOOP
        beq $t7, $t8, end_loop

        # PRINT OPTION 1
        li  $v0, 4
        la  $a0, select1
        syscall

        # PRINT OPTION 2
        li  $v0, 4
        la  $a0, select2
        syscall

        # PRINT OPTION 3
        li  $v0, 4
        la  $a0, select3
        syscall

        # PRINT OPTION 4 
        li  $v0, 4
        la  $a0, select4
        syscall

        # ASK FOR USER INPUT 
        li  $v0, 4
        la  $a0, prompt1
        syscall

        # READ INPUT
        li  $v0, 5
        syscall
        move $t0, $v0

        # CASE SWITCH
        li $t9, 1
        beq $t0, $t9, one # if $t0 == $t9
        li  $t9, 2
        beq $t0, $t9, two # if $t0 == $t9
        li  $t9, 3
        beq $t0, $t9, three
        li  $t9, 4
        beq $t0, $t9, four
        j   default


one:        # ADDITION

        li  $v0, 4
        la  $a0, prompt2        # PRINT PROMPT2
        syscall

        li  $v0, 5
        syscall
        move $t1, $v0       # READ INPUT

        li  $v0, 4
        la  $a0, prompt3        # PRINT PROMPT3
        syscall

        li  $v0, 5
        syscall
        move $t2, $v0       # READ INPUT

        li  $v0, 4
        la  $a0, prompt4    # PRINT RESULT MESSAGE
        syscall

        add $a0, $t1, $t2	# $a0 = $t1 + $t2
        li  $v0, 	1	# $v0 = 1
        syscall

        li  $v0, 4
        la  $a0, nl    # PRINT RESULT MESSAGE
        syscall

        j   default

two:

        li  $v0, 4
        la  $a0, prompt2        # PRINT PROMPT2
        syscall

        li  $v0, 5
        syscall
        move $t1, $v0       # READ INPUT

        li  $v0, 4
        la  $a0, prompt3        # PRINT PROMPT3
        syscall

        li  $v0, 5
        syscall
        move $t2, $v0       # READ INPUT

        li  $v0, 4
        la  $a0, prompt4    
        syscall

        sub $a0, $t1, $t2	# $a0 = $t1 + $t2
        li  $v0, 	1	# $v0 = 1
        syscall

        li  $v0, 4
        la  $a0, nl    # PRINT RESULT MESSAGE
        syscall

        j   default

three:

        li  $v0, 4
        la  $a0, prompt2        # PRINT PROMPT2
        syscall

        li  $v0, 5
        syscall
        move $t1, $v0       # READ INPUT

        li  $v0, 4
        la  $a0, prompt3        # PRINT PROMPT3
        syscall

        li  $v0, 5
        syscall
        move $t2, $v0       # READ INPUT

        li  $v0, 4
        la  $a0, prompt4    
        syscall

        mul $a0, $t1, $t2	# $a0 = $t1 + $t2
        li  $v0, 	1	# $v0 = 1
        syscall

        li  $v0, 4
        la  $a0, nl    # PRINT RESULT MESSAGE
        syscall

        j   default

four:

        li  $v0, 4
        la  $a0, prompt2        # PRINT PROMPT2
        syscall

        li  $v0, 5
        syscall
        move $t1, $v0       # READ INPUT

        li  $v0, 4
        la  $a0, prompt3        # PRINT PROMPT3
        syscall

        li  $v0, 5
        syscall
        move $t2, $v0       # READ INPUT

        li  $v0, 4
        la  $a0, prompt4    
        syscall

        div $a0, $t1, $t2	# $a0 = $t1 + $t2
        li  $v0, 	1	# $v0 = 1
        syscall

        li  $v0, 4
        la  $a0, nl    # PRINT RESULT MESSAGE
        syscall

        j   default

default:

        # ASK USER IF THEY WANT TO GO AGAIN
        li  $v0, 4
        la  $a0, prompt5
        syscall

        li  $v0, 5
        syscall
        move $t7, $v0

        j   while_loop
        

end_loop:

        li  $v0, 10
        syscall