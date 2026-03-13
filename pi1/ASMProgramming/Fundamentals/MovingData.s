@ MovingData.s
@ Adam Watkins 
@ November 2024

@ This file contains a short program that puts an immediate value 
@ (pre-fixed with #) into a register, and then moves this value to
@ another register.

@ The value in R0 when the program terminates is the Exit Code.
@ This is normally 0 for successful completion of the program. Other
@ values (0-255) can be used to convey information back to the operating
@ system or the user.


.global     main			@ Tells the gcc compiler where the program starts        

.text

main:     
    MOV     R1, #99         @ Place value 99 into Register 0
    MOV     R0, R1          @ Move contents of R1 to R0

exit:
    @ If using the RPI, uncomment the lines with the MOV and SWI instructions
    @ If using the simulator, comment the lines with the MOV and SWI instructions
@   MOV     R7, #1          @ Place code for Exit into R7
@   SWI     0               @ Make a system call to end the program
    @ If using the RPI, comment the line with B exit
    @ If using the simulator, uncomment the line with B exit
    B       exit
