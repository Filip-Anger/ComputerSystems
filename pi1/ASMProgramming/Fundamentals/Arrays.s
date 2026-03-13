@ Arrays.s
@ Adam Watkins 
@ February 2025

@ This file contains a program that finds the smallest value in an array
@ It uses indexed addressing and conditional execution in order to do this

@ Arrays are one of the fundamental data structures. Processors incorporate
@ instructions to quickly access array elements using offsets from
@ a base address. The base address is typically where the first item in the 
@ array is located.

@ There are numerous ways to solve this problem - this is just one implementation
@ The sequence of execution is numbered.

.global main

.text

main:
        LDR R0, =array1             @ 1 - Load the address of 1st element in array
        MOV R1, #array1size         @ 2 - Load number of items in the array
        BL MinVal                   @ 3 - Call function
                                    @ Function returns smallest value in R0
                                    @ Leave here so it can be seen in terminal
                                    @ with the command:
                                    @     echo $? 

exit:
    @ If using the RPI, uncomment the lines with the MOV and SWI instructions
    @ If using the simulator, comment the lines with the MOV and SWI instructions
@   MOV     R7, #1          @ Place code for Exit into R7
@   SWI     0               @ Make a system call to end the program
    @ If using the RPI, comment the line with B exit
    @ If using the simulator, uncomment the line with B exit
    B       exit



@@@@ MinVal: Find the smallest integer in an array (unsigned values)
@ Parameters:
@  R0 = array (base) address
@  R1 = length
@ Returns:
@  R0 = smallest value

@ This function works forwards through the array.  It does this by setting up R2 as a counter 
@ to index into the array and uses the first element's value as the initial minimum value. This 
@ is stored in R3.
@ We use the start address of the array (R0) to point to each element
@ Because our array is word values (4 bytes) we increment the R0 pointer by 4 each time
@ in order to point to the next element (LDR R3, [R0], #4)
@ We then increment the length parameter by 1 (ADD R2, #1) and compare this to length (CMP R2, R1)
@ If the counter >= length the code skips to the end of the function
@ The code then loads the next value, compares to the current smallest and updates R3 if needed
@ and then repeats (B again)
MinVal:
        STMFD SP!, {R4, LR}         @ Save R4 and LR on the stack
        MOV R2, #0                  @ 4 - Counter = 0  
        LDR R3,[R0], #4             @ 5 - Load R3 with 1st value in array (assume it is the smallest value)
                                    @ 6 -   R0 is also incremented by 4 after the load
again:                   
        ADD R2, #1                  @ 7 - Increment counter
        CMP R2, R1                  @ 8 - Compare counter to length and if counter ...
        BGT end                     @ 9 - IF >= length : then end function (exit loop)
        LDR R4,[R0],#4              @10 -    Load R4 with R0+counter*4 
        CMP R4, R3                  @11 - Compare R4 with current smallest value (R3)
        MOVLT R3, R4                @12 - IF R4 < R3 then store in R3 as minimum value
        B again                     @13 - Repeat (go back to step 7)
end:
        MOV R0, R3                  @14 - Return minimum value in R0
        LDMFD SP!, {R4, PC}         @ Restore R4 and LR from the stack
        MOV PC, LR                  @ Return to calling code


.data

@ Below we have defined a constant named 'arraysize' and an array of word values
@ The array is a sequence of word (32 bit in this case) values and the first item in the array
@ is given the label array1.
@ There is no need to give every array item a label. If we know the base address and the data size of 
@ the elements we can quickly calculate the memory location of any item based on its position in the 
@ array 

            .equ    array1size, 10
array1:     .word   0x0C15, 0x0101, 0x0022, 0x5B57, 0x278C, 0x009B, 0x0F06, 0x43FD, 0xFE42, 0xC4F5

            