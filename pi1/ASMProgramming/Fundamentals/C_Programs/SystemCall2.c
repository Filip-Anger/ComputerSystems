// C Programs : System Calls 2

// You can execute this program using https://www.onlinegdb.com/online_c_compiler
// You can read about the purpose of unistd.h here : https://en.wikipedia.org/wiki/Unistd.h

// Note that compiling this code, e.g. using https://godbolt.org/ will NOT yield the same code
// as that given in System.s. 

// When revising for the exam, or solving practicals DO NOT USE compiled C code

#include <unistd.h>                                                     

char input[10] = {0};                   // An array to store the input

int main()                              // Entry point to the program
{
    read(1, &input, 5);                 // Read 5 characters from the keyboard
    write(1, input, 5);                 // Repeat the typed chars back to the screen
}