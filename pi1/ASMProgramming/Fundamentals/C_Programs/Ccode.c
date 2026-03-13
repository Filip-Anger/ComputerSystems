#include <unistd.h>                                                     // code to make the write system call

int main()                                                              // Entry point of the program
{
    write(1, "Hello, My Name is Dorothy and I am from Kansas", 46)      // param 1 = stream, param2 = string, param3 = length
}
=======
#include <unistd.h>                                                     // code to make the write system call

char input[10] = {0};

int main()                                                              // Entry point of the program
{
    read(1, &input, 5);      // param 1 = stream, param2 = string, param3 = length
    write(1, input, 5);
}

=======

#include <unistd.h>                                                     // code to make the write system call

char input[10] = {0};
char message[] = "You typed:\n";
int messageLength = 11;

int main()                                                              // Entry point of the program
{
    read(1, &input, 5);                     // Read 5 characters from the keyboard
    write(1,message, messageLength);        // Display message
    write(1, input, 5);                     // Display characters read from keyboard
}

=======

// A simple program to find the smallest value in an array
// This is a C language program and can be executed using https://www.onlinegdb.com/online_c_compiler
// Note that assembling this program will NOT yield the code in Arrays.s

int array1size = 10;
int array1[10] = {0x0C15, 0x0101, 0x0022, 0x5B57, 0x278C, 0x009B, 0x0F06, 0x43FD, 0xFE42, 0xC4F5};

int MinVal(int[], int);

int main()
{
    int smallest = MinVal(array1, array1size);
    return smallest;
}

int MinVal(int array1[], int array1Size)
{
    int smallest = array1[0];
    for (int i=0; i < array1Size; i++)
    {
        if (array1[i] < smallest)
        {
            smallest = array1[i];
        }
    }
    return smallest;
}
=========





