    # Computer Organization Project
    # Rojal Sapkota
    # Fall 2023
    # Email: rojal.sapkota@bison.howard.edu
    # Student ID : @03086974

.data   
input_message:      .asciiz "Enter an integer: "
illegal_message:    .asciiz "Illegal Number!\n"
newline:            .asciiz "\n"

.text   
main:               
    li      $v0,    4
    la      $a0,    input_message
    syscall                                             # displays the input_message on the screen

    li      $v0,    5                                   # takes the input from the user
    syscall 
    move    $t0,    $v0                                 # Moves value from $v0 to $t0

    # loop to get legal number from the user
loop1:              

    # branch creation for when the number is greater than 24
    bgt     $t0,    24,                 find_fibonacci  # find_fibonacci is called if the number is greater than 24

    li      $v0,    4
    la      $a0,    illegal_message                     # Prints the string in illegal_message when the number is illegal
    syscall 

    li      $v0,    4
    la      $a0,    input_message                       # prints the string in input_message to ask the user to enter the number again
    syscall 

    li      $v0,    5
    syscall 
    move    $t0,    $v0

    j       loop1                                       # End of loop1

    #       
find_fibonacci:     
    move    $a0,    $v0
    li      $t0,    0
    li      $t1,    1

    move    $t3,    $a0
    sub     $t4,    $t3,                2               # subtracting the value 2 from the input number

    # creating a counter with initial value set to 0
    li      $t5,    0

    li      $v0,    1
    move    $a0,    $t0
    syscall 

    li      $v0,    4
    la      $a0,    newline                             # breaks the line or prints on new line
    syscall 

    li      $v0,    1
    move    $a0,    $t1
    syscall 

    li      $v0,    4
    la      $a0,    newline                             # breaks the line or prints on new line
    syscall 

    # loop to print the sequences
loop2:              
    beq     $t5,    $t4,                end_program     # branches to the program's end when $t5 equals $t4
    add     $t2,    $t0,                $t1
    add     $t0,    $zero,              $t1
    add     $t1,    $zero,              $t2

    li      $v0,    1
    move    $a0,    $t2
    syscall 

    li      $v0,    4
    la      $a0,    newline                             # prints new line
    syscall 

    addi    $t5,    $t5,                1               # Increases the value of counter by 1
    j       loop2                                       # End of loop2

    # this ends the program
end_program:        
    li      $v0,    10
    syscall 