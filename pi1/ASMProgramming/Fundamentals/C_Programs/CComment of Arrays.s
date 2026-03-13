@ C Comment of Arrays.s
@ Adam Watkins 
@ November 2024

@ This file contains a side by side comparison of Arrays.s and an equivalent C language program.
@ Note: Compiling the C code will not yield the given assembly! 

.global main

.text

main:                           @ int main() {
        LDR R0, =array1         @    // prepare the parameters for the function call 
        MOV R1, #array1size     
        BL MinVal               @ int smallest = MinVal(array1, array1size);
                                @   // Note the function returns the value in R0
                                @   //  R0 is unchanged so is returned to the OS
exit:
    @ If using the RPI, uncomment these two lines
    @ If using the simulator, comment these two lines
@   MOV     R7, #1          @ Place code for Exit into R7
@   SWI     0               @ Make a system call to end the program
    @ If using the RPI, comment this line
    @ If using the simulator, uncomment this line
    B       exit


MinVal:                         @ int MinVal(int array1[], int array1Size){
        MOV R2, #0              @ int i=0;
        LDR R3,[R0], #4         @      int smallest = array1[0]

again:                          @ for {
        ADD R2, #1              @         ; i++)
        CMP R2, R1              @               ; i<array1size
        BGT end                 @ }
        LDR R4,[R0],#4          
        CMP R4, R3              @ if(array1[i] < smallest)
        MOVLT R3, R4            @ { smallest = array1[i]
        B again                 @ }
end:
        MOV R0, R3
        MOV PC, LR              @ return smallest;}


.data

            .equ    array1size, 10      @ int array1size = 10;
array1:     .word   0x0C15, 0x0101, 0x0022, 0x5B57, 0x278C, 0x009B, 0x0F06, 0x43FD, 0xFE42, 0xC4F5
                                        @ int array1[10] = {0x0C15, 0x0101, 0x0022 ......

            