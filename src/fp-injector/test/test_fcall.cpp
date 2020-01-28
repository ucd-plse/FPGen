#include<stdio.h>

double foo(double a, double b){

  for(int i=0; i<5; i++){
    b += a;
  }
  return b;

}

int main(){
  double a, b;
  a = 12;
  b = 0;

  a = foo(a, b);

  for(int i=0; i<5; i++){
    b = foo(a, b);
  }

  printf("b=%lf\n", b);
  return 0;
}
