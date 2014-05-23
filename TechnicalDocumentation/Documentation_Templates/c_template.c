// you need to have "/** as the start of the comment block. "/*" will not be parsed!
/**
* @file c_template.c
* @brief short description of the code on this line. 
* @details Lorem Ipsum is simply dummy text of the printing and typesetting industry.    
* the details section can be several lines compared to brief which should be one.
* if several authors made the file just add another author command.
* @author David Alm
* @author David Victor Alm
* @version 2.0
*/ 

#include "c_template_header.h"

#define MAKRO_IN_C_FILE  ///< a macro with documentation

//prototype 
static void herp(int a, double b, char string [256]);

int int_a; 
///< This is commenting a variable.

double doub_b; ///< this also works 

/**
* This is the description of the main function.
* It is the beginning of the program.
* You always need a main ive heard or it won't compile.
* @return Returns a Integer of value 0.
*/
int main(){
  printf("Hello world\n");
  herp(5, 13.37, "test");
  return 0;
}

/**
* The herp function is used as a example for parameters.
* the "in" and "out" option under parameters is optional but i just wanted to show it exists.
* @param  [in]   a   I just like sending Integers.
* @param  [out] b   Doubles are nice as well.
* @param  [in,out] string     But I like strings the most.
* @return this is a void so nothing is returned.
*/
static void herp(int a, double b, char string [256]){
    int d;
    d = 1337; 
    
}