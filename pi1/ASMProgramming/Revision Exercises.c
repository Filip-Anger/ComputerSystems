====== Optional:  Algorithms to Implement as exam revision



// Printing an array of characters one char at a time
#include <unistd.h>                                                     // System calls header file

char name[] = {'E','l','v','i','s','\n'};
int name_length = 6;

void print(char[], int);

int main()                                                              
{
    char endLine[] = {'\n'};
    for (int i=0; i < name_length ; i++)
    {
        char toPrint[] = {name[i]};
        print(toPrint, 1);
        print(endLine,1);
    }
}

void print(char *message, int length)
{
    write(1, message, length);
}


======================================

// Determine and return the largest value in an array
// Note: this assumes int is signed
int MaxVal(int array1[], int array1Size)
{
    int largest = array1[0];
    for (int i=0; i < array1Size; i++)
    {
        if (array1[i] > largest)
        {
            largest = array1[i];
        }
    }
    return largest;
}

======================================
// Sum all elements in an array
// Note: this assumes int is signed
int SumArray(int array1[], int array1Size)
{
    int total = 0;
    for (int i=0; i < array1Size; i++)
    {
        total+= array1[i];
    }
    return total;
}


======================================
// Repeat the Guessing Game 

char playAgain[] = "Would you like to play again?\n";
int messageLength = 30;
char input[3] = {0}

void play_again()
{
    write(1,msg_playAgain, len_playAgain);
    read(1, &input, 3); 
    //force input[0] to lower case
    input[0] = input[0] - 'n';
}

========

