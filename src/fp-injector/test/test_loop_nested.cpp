#include<stdio.h>

int main(){
  double a, b;
  a = 12;
  b = 0;
  for(int i=0; i<5; i++){
    b += 1;
    b += a;
    for(int i=0; i<5; i++){
    a -= b;
    }
  }

  for(int i=0; i<5; i++){
    b += a;
  }

  printf("b=%lf\n", b);
  return 0;
}
