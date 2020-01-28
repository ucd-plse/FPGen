#ifndef _INJECTIONS_H
#define _INJECTIONS_H

#define CANCEL 0
#define ROUND 1
#define ALL_FP 2

extern void fp_injection(void * psrc1, void * psrc2, void * pdest);
extern void log_sampled_fp_injection(void * psrc1, void * psrc2, void * pdest, int* pcounter, int step, int);
extern void uniform_sampled_fp_injection(void * psrc1, void * psrc2, void * pdest, int* pcounter, int step, int);
#endif
