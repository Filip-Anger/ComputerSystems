// atoi.s
// Adam Watkins 
// December 2024

// A simple program to convert a single ASCII character to its integer equivalent

.global     main

.text

main:     
        LDR     R1, =the_char   @ Load R1 with the address of the character
        LDR     R0, [R1]        @ Load R0 with the value of the character
        BL		atoi            @ Call the function
                             
exit:
    @ If using the RPI, uncomment the lines with the MOV and SWI instructions
    @ If using the simulator, comment the lines with the MOV and SWI instructions
@   MOV     R7, #1          @ Place code for Exit into R7
@   SWI     0               @ Make a system call to end the program
    @ If using the RPI, comment the line with B exit
    @ If using the simulator, uncomment the line with B exit
    B       exit


@@@@ atoi: 		Convert ASCII hex character to its integer value
@ Parameters: 
@   R0: ASCII character (assumed '0'-'9', 'A'-'F' or 'a'-'f')
@ Returns:
@   R0: Integer value of provided character
atoi:
        CMP     R0, #0x40       	@ Compare with the character smaller than 'A/a'
        SUBLT   R0, #0x30       	@ If in range 0-9, substract '0'
        ORRGT   R0, #0x60       	@ If in range A-F or a-f, force lower case ...
        SUBGT   R0, #0x57       	@    and substract 'a'-10
        MOV     PC, LR


.data

the_char:    .word   0x43
