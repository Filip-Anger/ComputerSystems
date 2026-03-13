// C Programs : System Calls

// This program is the C equivalent of SystemCall.s

// You can execute this program using https://www.onlinegdb.com/online_c_compiler
// You can read about the purpose of unistd.h here : https://en.wikipedia.org/wiki/Unistd.h

// Note that compiling this code, e.g. using https://godbolt.org/ will NOT yield the same code
// as that given in System.s. 

// When revising for the exam, or solving practicals DO NOT USE compiled C code

#include <unistd.h>                                                     // code to make the write system call

char name[] = {'E','l','v','i','s','\n'};
int name_length = 6;
char place[] = {'T','u','p','e','l','o','\n'};
int place_length = 7;

void print(char[], int);

int main()                                      // Entry point of the program
{
    print(name, name_length);                   // Note that in C, the name of the array can be given as a parameter
    print(place, place_length);                 // but it is actually the address of the first element that is passed
}                                               // NOT the array values themselves

void print(char *message, int length)           // Note the *message indicates that the passed parameter is a 
{                                               // pointer to data
    write(1, message, length);
}