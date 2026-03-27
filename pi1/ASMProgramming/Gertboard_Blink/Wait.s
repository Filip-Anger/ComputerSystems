@ Wait.s
@ Adam Watkins, Richard Verhoeven
@ November 2020

@ A function to implement a delay based on the System Timer
@ This file will not assemble/compile as a standalone

                                        @ Set counter = 10 already in 
                        @ PARAMETERS
                        @ Blinking pin R1, #22	
                        @ R2, count
                        @ R3 delay (ms) 
blink_loop:
                @ Turn an LED on
                MOV R0, R1
                MOV R1, #0x1C
                BL		set_pin_function	@ Set pin to output
		CMP		R0, #0			@ If return value ... 
		BLT		exit

                @ Load the delay (ms) into R0
                MOV R0, R3
                BL              wait            @ Call the wait function
                @ Turn the LED off
                MOV R0, R1
                MOV R1, #0x28 
                BL		set_pin_function	@ Set pin to output
		CMP		R0, #0			@ If return value ... 
		BLT		exit
                @ Load the delay (ms) into R0
                MOV R0, R3
                BL              wait                    @ Call the wait function
                @ Decrement counter
                SUB R3, #1
                @ IF counter > 0
                CMP R3, #0
                @ THEN Branch to blink_loop
                BGT             blink_loop   
                @ ELSE End Program
                BL              exit

@@@@@ wait: wait for R0 milliseconds.
@ Arguments:
@	R0: number of milliseconds
@ Returns:
@   None
wait:
        STMFD	SP!, {R2-R5,LR}
        CMP	    R0, #0
        BLE	    wait_exit	        @ Don't wait zero or negative time.
        MOV	    R2, #125
        MOV	    R2, R2, LSL #3      @ R2 = 1000
        MULS    R0, R0, R2	        @ Convert milliseconds to microseconds
        BVS	    wait_exit	        @ In case of an overflow, exit.
        LDR	    R3, =clockbase		@ Load clockbase address
        LDR	    R3, [R3]	        @ Load clockbase value
        LDR	    R2, [R3,#4]         @ Read current CLO value
        SUB	    R5, R2, #1	        @ Save current CLO - 1
        ADDS    R4, R2, R0	        @ Add number of microseconds
        BCC	    wait_clk	        @ No carry, skip waiting for rollover.
wait_rollover:
        LDR	    R2, [R3,#4]
        CMP	    R2, R5		        @ Compare current to past time
        BHI	wait_rollover	        @ If higher/same, wait some more
        @ special condition:
        @ R4 = 2^32-N and process is not active during N microseconds
        @ overflow will happen while waiting
        MOV	    R5, R2		        @ Save last CLO value
wait_clk:
        LDR	    R2, [R3,#4]			@ Read current CLO value
        CMP	    R5, R2				@ Compare current to past time
        BHI	    wait_exit	        @ If higher then exit
        MOV	    R5, R2				@ Save last CLO value
        CMP	    R4, R2				@ Compare to target time
        BHI	    wait_clk	        @ If higher, wait some more
wait_exit:
        LDMFD   SP!, {R2-R5,LR}
        MOV     PC, LR
