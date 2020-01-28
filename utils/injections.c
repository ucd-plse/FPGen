#include <stdio.h>
#include <math.h>
#include <limits.h>
#include <stdbool.h>
#include "injections.h"

#ifndef sigma
#define sigma 0.0001
#endif
#ifndef cancel_delta_e
#define cancel_delta_e 40
#endif
#ifndef round_delta_e
#define round_delta_e 32
#endif

#define abs(a) ((a)>0?(a):(-(a)))
#define max(a, b) (((a)>(b))?(a):(b))
#define min(a, b) (((a)<(b))?(a):(b))
#define abs_mask(a) ((a)>>(sizeof(long)*8-1))
#define abs_bt(a) (((a)+abs_mask(a))^(abs_mask(a)))
#define max_bt(a, b) ((a)^(((a)^(b)) & -((a)<(b))))

#define exp(a) (log2(abs(a)))
#define exp_bt(pa) (long)((*(unsigned long *)(pa)>>52)&0x7ff)

#define cancel(src1, src2, dest) ((max(exp(src1), exp(src2))-exp(dest))>cancel_delta_e)
#define cancel_bt(psrc1, psrc2, pdest) (max_bt(exp_bt(psrc1), exp_bt(psrc2)) - exp_bt(pdest) > cancel_delta_e)

#define round(src1, src2, dest) (abs(max(src1, src2)-(dest)+min(src1, src2))>sigma)
#define round_bt(psrc1, psrc2) (abs_bt(exp_bt(psrc1) - exp_bt(psrc2)) > round_delta_e)

void fp_injection(void * psrc1, void * psrc2, void * pdest){

  //printf("src1=%le, src2=%le, dest=%le:", *(double *)psrc1, *(double *)psrc2, *(double *)pdest);
  if(isnormal(*(double *)psrc1) & isnormal(*(double *)psrc2)){   
    if(round_bt(psrc1, psrc2))
      printf("1");
    else{
      if(cancel_bt(psrc1, psrc2, pdest))
        printf("0");
      else
        printf("-");
    }
  }
  //printf("\n");
}

void cancel_injection(void * psrc1, void * psrc2, void * pdest){

  //printf("src1=%le, src2=%le, dest=%le:", *(double *)psrc1, *(double *)psrc2, *(double *)pdest);
      
  if(cancel_bt(psrc1, psrc2, pdest) & isnormal(*(double *)psrc1) & isnormal(*(double *)psrc2))
    printf("0");
  else
    printf("*");

  //printf("\n");
}

void round_injection(void * psrc1, void * psrc2, void * pdest){

  //printf("src1=%le, src2=%le, dest=%le:", *(double *)psrc1, *(double *)psrc2, *(double *)pdest);
      
  if(round_bt(psrc1, psrc2) & isnormal(*(double *)psrc1) & isnormal(*(double *)psrc2))
    printf("1");
  else
    printf("#");

  //printf("\n");
}

void log_sampled_fp_injection(void * psrc1, void * psrc2, void * pdest, int* pcounter, int step, int injection){
  if(*pcounter == INT_MAX)
    return;

  (*pcounter)++;

  int bound=pow(10, ceil(log10(*pcounter)));
  bound = (bound==1)? 10: bound;

  if(*pcounter % (bound/10*step) == 0){
    //printf("\nlog sampling: counter=%d\n", *pcounter);
    switch(injection){
     
      case ALL_FP :
        fp_injection(psrc1, psrc2, pdest);
        break;

      case CANCEL :
        cancel_injection(psrc1, psrc2, pdest);
        break;

      case ROUND :
        round_injection(psrc1, psrc2, pdest);
        break;
    }
  }
}


void uniform_sampled_fp_injection(void * psrc1, void * psrc2, void * pdest, int* pcounter, int step, int injection){
  if(*pcounter == INT_MAX)
    return;

  (*pcounter)++;

  if(*pcounter % step == 0){
    switch(injection){
     
      case ALL_FP :
        fp_injection(psrc1, psrc2, pdest);
        break;

      case CANCEL :
        cancel_injection(psrc1, psrc2, pdest);
        break;

      case ROUND :
        round_injection(psrc1, psrc2, pdest);
        break;
    }
  }
}
