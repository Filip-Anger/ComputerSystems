@ RandNumHW.s
@ Adam Watkins 
@ November 2024


.equ        RAND_LIMIT, 0xF             @ Question: What is the maximum value possible?
.equ        SYS_EXIT,   0x1
.equ		CLOCK_ADDR, 0x3F003004 		@ TASK: Add clock hardware address constant

.text 

.include "Hardware.s"


@ Functions

@@@@ gen_number_hardware: Generate a number based on the hardware clock
@ Parameters:
@   none
@ Returns: 
@   R0:             7-bit 'random' value
gen_number_hardware:
    STMFD   SP!, {R1}           @ R1 used in this function so store on stack
    LDR     R1, =clockbase      @ Load mapped memory address
    LDR     R1, [R1]            @ Load mapped memory address contents
    CMP     R1, #0              @ Check if clockbase was initialized
    MOVEQ   R0, #RAND_LIMIT     @ If not initialized, return a fixed number.
    LDRGT   R0, [R1, #4]        @ Otherwise, load hardware clock value.
    AND     R0, #RAND_LIMIT     @ Mask lower 7 bits
    LDMFD   SP!, {R1}
    MOV     PC, LR


                                    
.data     

@@@@ Constants

dev_mem: .asciz "/dev/mem"          @ TASK: Add string constant for filename

.align 4
file_desc:      .word 0x0           @ File descriptor for /dev/mem
clockbase:      .word 0x0           @ TASK: Add variable to store start of mapped hardware address

