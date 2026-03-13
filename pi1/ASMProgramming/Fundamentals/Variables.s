@ Variables.s
@ Adam Watkins 
@ December 2021

@ This file contains a short program that loads and stores values to/from 
@ memory locations (variables/constants). Pre-defined variables/constants 
@ are needed when the number of data items in a program exceeds the number
@ of available registers.

@ Using the value of a constant (in this case, OverHead) is a one-step process
@ using the MOV function.

@ Loading a variable value is a 2-step process; first we load the address of 
@ a variable (in this case ItemCost), we then load the value using indirect
@ addressing.
@ Question : What would the value in R2 be after "LDR R2,Overhead"?
@ You may need the answer to this later!

@ Storing a value to a variable, or named memory location is again a 2-step
@ process


.global     main

@ Moving Data 2
.text

main:     
    MOV     R1, #OverHead   @ Load R1 with value of constant OverHead
    MOV     R0, R1          @ Move contents of R1 to R0
    
                            @ Loading the value of a variable....
    LDR     R2, =ItemCost   @ Load R2 with the address of variable 'ItemCost'
    LDR     R1, [R2]        @ Load R1 with contents of address in R2 (i.e. 'ItemCost')

    ADD     R1, R1, R0      @ R1 = R1 + R0

                            @ Storing a value 'to' a variable 
    LDR     R2, =TotalCost  @ Load the address of variable 'TotalCost'
    STR     R1, [R2]        @ Store sum (R1) in address within R2 (i.e. 'TotalCost')
    
    MOV     R0, R1          @ Copy R1 to R0 and use as program exit code
 
exit:
    @ If using the RPI, uncomment the lines with the MOV and SWI instructions
    @ If using the simulator, comment the lines with the MOV and SWI instructions
@   MOV     R7, #1          @ Place code for Exit into R7
@   SWI     0               @ Make a system call to end the program
    @ If using the RPI, comment the line with B exit
    @ If using the simulator, uncomment the line with B exit
    B       exit



.data

.equ        OverHead, 0x14      @ This is a constant for use within the ItemCost code
                                @ It is similar to a '#define OverHead 0x14' in C
				@ It can be defined wherever we like in the code because
				@ .equ is a compiler directive and will not result in any
				@ machine code instructions, though for clarity it makes sense
				@ to define the .equ at the start of the .data or .text sections

ItemCost:   .word   0x50        @ This is a variable value that can be addressed
                                @ It is like 'unsigned int word = 0x50' in C

TotalCost:  .space 4            @ This is also a variable value that can be addressed, but
                                @ more like 'unsigned int'. It is a 4 byte space
                                @ Because we are in the .data section these are simply 
                                @ numeric values that can be accessed via the label
                                
