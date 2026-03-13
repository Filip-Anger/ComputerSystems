// Adam Watkins
// December 2024

// A program to convert an integer to it's ASCII equivalent, e.g. 16 -> 'F'

// This is a C language program and can be executed using https://www.onlinegdb.com/online_c_compiler
// Note that compiling this code will NOT yield the assembly code in the comments below.

int itoa(int value);


int main()                                          // Entry point of the program
{
    int value = 12;                                 // Declare and define the value to convert
    char character;                                 // Declare a variable to hold the result
    character = itoa(value);                        // Call the conversion function, pass the value as a parameter

    return character;                               // Return the ASCII value of the char to the console
}


int itoa(int value)
{
    if ( value <= 9)                                
    {                                               
        value = value + '0';                
    }                                               
    if (value > 9)
    {
        value = value + 'A'-10;
    }
    return value;
}
