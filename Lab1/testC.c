#include <stdio.h>
// SOLUTION FILE

int main()
{
  int var_int;                    // 2

  unsigned char uchar1, uchar2;   // 3
  signed char schar1, schar2;

  int x, y;                       // 4

  char i;                         // 5
  char shift_char;

  int a[10] = {0,10,20,30,40,50,60,70,80,90};    // 6

  int b[10], c[10];               // 7
  int *ip, *ip2;
  int j, k;

  char AString[] = "HAL";           // 8

  // 1 -- change "World" to your name
  printf("\n\n PART 1 ---------\n");

  printf("\n Hello Ruben! \n");

  // 2 -- find sizes of the other C datatypes
  printf("\n\n PART 2 ----------\n");

  printf("\n size of data type int = %d ", sizeof(var_int));

  printf("\n size of data type char = %d ", sizeof(i));

  double var_d;
  printf("\n size of data type double = %d ", sizeof(var_d));

  float var_f;
  printf("\n size of data type float = %d ", sizeof(var_f));

  // 3 -- explore signed versus unsigned datatypes and their interactions
  printf("\n\n PART 3 ----------\n");

  uchar1 = 0xFF;
  uchar2 = 0xFE;
  schar1 = 0xFF;
  schar2 = 0xFE;

  printf("\n uchar1 = %d ", uchar1);
  printf("\n schar1 = %d ", schar1);

  //the differince in uchar1 and schar1
  printf("\n\n The differience between uchar1 and schar1 is their respective data type. uchar1 is unsigned interger and schar1 is a signed integer.");
  printf("\n This means the signed integer is outputting the negtive number while the unsigned integer is the 2's complement of that number "); 

  //printing larger between uchar1 and uchar2
  if (uchar1 > uchar2){
    printf("\n\n uchar1 is greater than uchar2 with a value of %d", uchar1);
  } else {
    printf("\n\n uchar2 is greater than uchar1 with a value of %d", uchar2);
  }

  //printing larger between schar1 and schar2
  if (schar1 > schar2){
    printf("\n\n schar1 is greater than schar2 with a value of %d", schar1);
  } else {
    printf("\n\n schar2 is greater than schar1 with a value of %d", schar2);
  }

  //printing larger between schar1 and uchar1 & eleboration
  if (schar1 > uchar1){
    printf("\n\n schar1 is greater than uchar1 with a value of %d", schar1);
  } else {
    printf("\n\n uchar1 is greater than schar1 with a value of %d", uchar1);
  }
  printf("\n It is expected that the unsigned variable would be greater since the signed ones are negative");

  printf("\n\n The sum of schar1 and schar2 is %d", schar1 + schar2);
  printf("\n This is expected since (-1) + (-2) is -3");

  printf("\n\n The sum of uchar1 and uchar2 is %d", uchar1 + uchar2);
  printf("\n This is expected since (255) + (254) is 509");

  printf("\n\n The sum of shcar1 and uchar1 is %d", schar1 + uchar1);
  printf("\n This is expcted since (-1) + (255) is 254");

  // 4 -- Booleans
  printf("\n\n PART 4 ----------\n");

  x = 1; y = 2;

  //printing values of boolean
  printf("\n\n Boolean TRUE value is %d", x != y);
  printf("\n Boolean FALSE value is %d", x == y);

  //printing size of boolean
  printf("\n\n The size of a Boolean is %d", sizeof(x != y));

  //Difference between & and && behavior
  printf("\n\n The differnce between & and && is & is a bitwise operator and && is a logical operator");
  printf("\n An example of && is x && y = %d", x && y);
  printf("\n An example of & is x & y = %d", x & y); 

  //Difference between ~ and ! behavior
  printf("\n\n The differnce between ~ and ! is ~ is a not bitwise operator and ! is a not logical operator");
  printf("\n An example of ! is !y = %d", !y);
  printf("\n An exmaple of ~ is ~y = %d, which make since because it take the inverse as a signed int", ~y); 


  // 5 -- shifts
  printf("\n\n PART 5 ----------\n");
  
  //initalizing numbers to shift by
  shift_char = 15;
  i = 1;
  j = 3;
  k = 7;

  //printing the shifts of different bits
  printf("\n shift_char = %d", shift_char);
  printf("\n shift_char << %d = %d, is a shift of 1111 (15) by 1 bit left", i, shift_char << i);
  printf("\n shift_char >> %d = %d, is a shift of 1111 (15) by 1 bit right", i, shift_char >> i);

  printf("\n\n shift_char << %d = %d, is a shift of 1111 (15) by 3 bits left", j, shift_char << j);
  printf("\n This makes sense because 1111 (15) shifted 3 left is 1111000 which is %d in binary", shift_char << j);

  printf("\n\n shift_char << %d = %d, is a shift of 1111 (15) by 7 bits left", k, shift_char << k);

  // 6 -- pointer basics
  printf("\n\n PART 6 ----------\n");

  ip = a;
  
  //Changed to match the print of (0 0 10 0 10 40 0)
  printf("\n start %d %d %d %d %d %d %d \n",
	 a[0], a[0], *(ip), *ip++, *(ip+1), *(ip+4), *(ip-1));

  
  //Printing the output (10 10 20 10 20 50 10)
  printf("\n start %d %d %d %d %d %d %d \n",
	 a[1], a[1], *(ip), *ip++, *(ip+1), *(ip+4), *(ip-1));

  //Determine size of integer pointer, pointer value and place in memory
  printf("\n size of integer pointer is %d", sizeof(ip));

  printf("\n\n The pointer value of ip = %x", ip);
  printf("\n The pointer value is in hex because it that place in memory, which is very large to the point is needs to be written in hex");
  printf("\n The pointer value value of ip + 1 = %x", ip + 1);
  printf("\n The difference between ip and ip + 1 is 4 because ip + 1 point at the next integer value which is 4 bytes");

  // 7 -- programming with pointers
  printf("\n\n PART 7 ----------\n");
  
  printf("\n First I am reversing the array by conventional array indices\n");//doing this
  int z = 9;
  for(i = 0; i < 10; i++){
    b[i] = a[z];
    z--;
  }
  printf("\n a = ");
  for(i = 0; i < 10; i++){
    printf("%d ", a[i]);
  }
  printf("\n and in reverse is");
  printf("\n b = ");
  for(i = 0; i < 10; i++){
    printf("%d ", b[i]);
  }

  printf("\n\n Second I am reversing the array by pointers\n");//doing this 
  int *p1, *p2, *p3;

  p1 = a;
  p2 = c + 9;
  p3 = c; //have to make a third so it points to the start of the c array without any changes in the while loop 

  while (p1 < a + 10) {
    *p2 = *p1;
    p1++;
    p2--;
  } //using the while loop and thee second pointer to get the reverse order of the array

  //reset the pointer to start at the array of a and negate the affects of while loop on a
  p1 = a;
  printf("\n a = ");
  for(i = 0; i < 10; i++){
    printf("%d ", *p1++);
  }

  //using the third pointer to start from first point of c
  printf("\n c = ");
  for(i = 0; i < 10; i++){
    printf("%d ", *p3++);
  }
  // 8 -- strings
  printf("\n\n PART 8 ----------\n");

  printf("\n %s \n", AString);

  //Printing ascii value of characters 
  printf(" These are ASCII values of characters in string");
  printf("\n H = %d", AString[0]);
  printf("\n A = %d", AString[1]);
  printf("\n L = %d", AString[2]);

  //Printing the value of byte after last character
  printf("\n\n Value of the last byte in string = %d, which is a null character", AString[3]);

  //Printing ascii value of characters + 1
  printf("\n\n These are ASCII values of characters in string + 1");
  printf("\n H + 1 = %c", AString[0] + 1);
  printf("\n A + 1 = %c", AString[1] + 1);
  printf("\n L + 1 = %c", AString[2] + 1);
  printf("\n We get IBM which is expected because that is the next letter or in decimal (+1) from the previous");

  //Adding 60 to last byte and printing 
  AString[3] = AString[3] + 60;
  printf("\n\n %s", AString);
  printf("\n This makes sense because the last byte is 0 but adding 60 give us < becuase its int vlue from the ASCII table is 60");


  // 9 -- address calculation
  printf("\n\n PART 9 ----------\n");

  printf(" Printing out output array addresses by direct refrence\n");
  ip2 = b;
  for (k = 0; k < 10; k++){
    printf("\n %d -- %x", k, ip2);
    b[k] = a[k];
    *ip2++;
  }         // direct reference to array element

  printf("\n");

  printf("\n Printing out output array addresses by indirect refrence\n");
  ip = a;
  ip2 = b;
  for (k = 0; k < 10; k++){
    printf("\n %d -- %x", k, ip2);
    *ip2++ = *ip++; 
  }    // indirect reference to array element

  // all done
  printf("\n\n ALL DONE\n");


  return 0;
}