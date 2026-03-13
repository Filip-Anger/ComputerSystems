// Adam Watkins
// November 2022

// A program to convert a char array to the integer equivalent, e.g. '12F' -> 303

// This is a C language program and can be executed using https://www.onlinegdb.com/online_c_compiler
// Note that assembling this program will NOT yield the solution to the question in the practical. It is 
// included for your understanding and revision purposes;

int atoi(char hexDigit);
int asctonum(char charArray[]);

char charArray[] = {'0','2','F','\n'};


int main()                                          // Entry point of the program
{
    int value;
    value = asctonum(charArray);                    // Call the conversion function
    // ...do something with value
    // we will return it to the console 
    // just to illustrate the conversion
    // (only values 0-255 work are valid
    return value;
}

int asctonum(char charArray[])                      // Iterate over a character array and  
{                                                   // return the integer equivalent
    int index = 0;                                  // Note that this is not an optimal
    int total = 0;                                  // algorithm; but it should at least
    while (charArray[index] != '\n')                // be clear how the code works
    {                                               
        char current = charArray[index];            
        total = total << 4;                         // ... why is this bit shift needed?
        total += atoi(current);
        index++;
    }
    return total;
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