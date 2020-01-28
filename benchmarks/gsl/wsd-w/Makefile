S3FP_DIR=/home/fptesting/s3fp-v0.1
export LD_LIBRARY_PATH := $(S3FP_DIR):$(LD_LIBRARY_PATH)
gsl=${GSL_PATH}-inout

CC=g++

N=64
TIMEOUT=7200
RESOURCE= TIME # or SVE
INPUTLB=-100.0
INPUTUB=100.0
RSEED=0
FTERROR=REL # or ABS or ULP
REL_DELTA=0.001 

all: comps

comps: sequential-64 sequential-80

sequential-64:
	$(CC) -o sequential-64 -DFB=64 -DN=$(N) -I${gsl}/include -L${gsl}/lib wsd-w-INOUT.c -lgsl -lgslcblas
sequential-80:
	$(CC) -o sequential-80 -DFB=80 -DN=$(N) -I${gsl}/include -L${gsl}/lib wsd-w-INOUT.c -lgsl -lgslcblas 

create-base-conf:
	@echo "==== generate s3fp_setting ====" 
	@echo TIMEOUT = $(TIMEOUT) > s3fp_setting
	@echo RESOURCE = $(RESOURCE) >> s3fp_setting
	@echo RSEED = $(RSEED) >> s3fp_setting
	@echo FTERROR = $(FTERROR) >> s3fp_setting
	@echo REL_DELTA = $(REL_DELTA) >> s3fp_setting
	@echo UNIFORM_INPUT = true >> s3fp_setting
	@echo UNIFORM_INPUTLB = $(INPUTLB) >> s3fp_setting
	@echo UNIFORM_INPUTUB = $(INPUTUB) >> s3fp_setting

test-urt: create-base-conf
	@echo RT = URT >> s3fp_setting
	@echo PARALLELRT = false >> s3fp_setting
	@echo "==== run s3fp ====" 
	#@$(S3FP_DIR)/s3fp 32 $(N) test_input ./sequential-32 test_output_32 ./sequential-128 test_output_128	
	@$(S3FP_DIR)/s3fp 32 $(N) test_input ./sequential-64 test_output_64 ./sequential-80 test_output_80	

test-bgrt: create-base-conf
	@echo RT = BGRT >> s3fp_setting
	@echo PARALLELRT = false >> s3fp_setting
	@echo "==== run s3fp ====" 
	#@$(S3FP_DIR)/s3fp 32 $(N) test_input ./sequential-32 test_output_32 ./sequential-128 test_output_128	
	@$(S3FP_DIR)/s3fp 32 $(N) test_input ./sequential-64 test_output_64 ./sequential-80 test_output_80	

clean:
	-rm -f sequential-32 sequential-64 sequential-80
	-rm -f test_input* test_output_*
	-rm -f __outdump
	-rm -f best_input
