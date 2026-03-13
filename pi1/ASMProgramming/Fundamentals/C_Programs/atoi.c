// Adam Watkins
// December 2024

// A program to convert a char to an integer equivalent, e.g. 'F' -> 16

// This is a C language program and can be executed using https://www.onlinegdb.com/online_c_compiler
// Note that compiling this code will NOT yield the assembly code in the comments below.

int atoi(char hexDigit);                            


int main()                                          // Entry point of the program
{
    char hexDigit = 'c';                            // ASCII character to convert
    int value;                                      // Declare a variable to hold the result
    value = atoi(hexDigit);                         // Call the conversion function, pass the character as a parameter

    return value;                                   // Return the value to the console
}


int atoi(char hexDigit)
{
    if ( (hexDigit - '@') < 0)                      // Note that this pair of conditionals is used to 
    {                                               // determine if a value is <0 or >0. It is not possible
        hexDigit = hexDigit-'0';                    // to use an if..else.  In ARM assembly this can be done
    }                                               // with a single comparison along with GT and LT
    if (hexDigit > '@')
    {
        hexDigit = hexDigit | 0x60;
        hexDigit = hexDigit - ('a'-10);
    }
    return hexDigit;
}
