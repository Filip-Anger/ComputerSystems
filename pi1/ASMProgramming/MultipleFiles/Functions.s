@ Functions.s
@ Adam Watkins 
@ November 2021

@ This file contains a short program that puts an immediate value 
@ into a register, calls a function in another file with R0 as the
@ parameter and then exits
.global     main

.text
.include "AnotherFile.s"	@ Here we specify the name of the other file
							@ Because it is 'included' we can use:
							@      gcc -o function Functions.s
							@ to assemble everything i.e. we do not have to 
							@ mention the other file in the command line
							@ Use ./function to execute
							@ Use echo$? to see the result in R0



@ Moving Data

main:     
    MOV     R0, #99         @ Place value 99 into Register 0
    BL		AFunction		@ Call the other function



exit:
    MOV     R7, #1          @ Place code for Exit into R7
    SWI     0               @ Make a system call to end the program
