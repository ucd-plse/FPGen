S3FP_DIR=/home/fptesting/s3fp-v0.1
export LD_LIBRARY_PATH := $(S3FP_DIR):$(LD_LIBRARY_PATH)

CC=gcc

N=32
TIMEOUT=7200
#RESOURCE=SVE # or TIME
RESOURCE=TIME # or SVE
INPUTLB=-100.0
INPUTUB=100.0
RSEED=0
FTERROR=REL # or ABS or ULP
REL_DELTA=1.175494351e-38F

SourceCode=qr-INOUT.c
Meschach64=/home/fptesting/FPTesting/benchmarks/matrix/meschach
Meschach128=/home/fptesting/FPTesting/benchmarks/matrix/meschach-ld

all: compile

compile: comp-sequential comp-parallel

comp-sequential: sequential-64 sequential-128

sequential-32: 
	$(CC) -o sequential-32 -DFT=float -DN=$(N) $(SourceCode)
sequential-64:
	$(CC) -o sequential-64 -DFT=double -DN=$(N) -I$(Meschach64) $(SourceCode) $(Meschach64)/meschach.a
sequential-128:
	$(CC) -o sequential-128 -DFT=__float128 -DN=$(N) -I$(Meschach128) $(SourceCode) $(Meschach128)/meschach.a

comp-parallel: parallel-32 parallel-128

parallel-32:
	$(CC) -o parallel-32 -DFT=float -DN=$(N) $(SourceCode) 
parallel-64:
	$(CC) -o parallel-32 -DFT=float -DN=$(N) $(SourceCode) 
parallel-128:
	$(CC) -o parallel-128 -DFT=__float128 -DN=$(N) $(SourceCode) 

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

test-urt-seq: create-base-conf
	@echo RT = URT >> s3fp_setting
	@echo PARALLELRT = false >> s3fp_setting
	@echo "==== run s3fp ====" 
	#@$(S3FP_DIR)/s3fp 32 $(N) test_input ./sequential-32 test_output_32 ./sequential-128 test_output_128	
	@$(S3FP_DIR)/s3fp 32 $(N) test_input ./sequential-64 test_output_64 ./sequential-128 test_output_128	

test-urt-par: create-base-conf
	@echo RT = URT >> s3fp_setting
	@echo PARALLELRT = true >> s3fp_setting
	@echo "==== run s3fp ====" 
	@$(S3FP_DIR)/s3fp 32 $(N) test_input ./sequential-32 test_output_32 ./sequential-128 test_output_128	

test-bgrt-seq: create-base-conf
	@echo RT = BGRT >> s3fp_setting
	@echo PARALLELRT = false >> s3fp_setting
	@echo "==== run s3fp ====" 
	#@$(S3FP_DIR)/s3fp 32 $(N) test_input ./sequential-32 test_output_32 ./sequential-128 test_output_128	
	@$(S3FP_DIR)/s3fp 32 $(N) test_input ./sequential-64 test_output_64 ./sequential-128 test_output_128	

test-bgrt-par: create-base-conf
	@echo RT = BGRT >> s3fp_setting
	@echo PARALLELRT = true >> s3fp_setting
	@echo "==== run s3fp ====" 
	@$(S3FP_DIR)/s3fp 32 $(N) test_input ./sequential-32 test_output_32 ./sequential-128 test_output_128	

test-ils-seq: create-base-conf
	@echo RT = ILS >> s3fp_setting
	@echo PARALLELRT = false >> s3fp_setting
	@echo "==== run s3fp ====" 
	@$(S3FP_DIR)/s3fp 32 $(N) test_input ./sequential-32 test_output_32 ./sequential-128 test_output_128	

test-ils-par: create-base-conf
	@echo RT = ILS >> s3fp_setting
	@echo PARALLELRT = true >> s3fp_setting
	@echo "==== run s3fp ====" 
	@$(S3FP_DIR)/s3fp 32 $(N) test_input ./sequential-32 test_output_32 ./sequential-128 test_output_128	

test-pso-seq: create-base-conf
	@echo RT = PSO >> s3fp_setting
	@echo PARALLELRT = false >> s3fp_setting
	@echo "==== run s3fp ====" 
	@$(S3FP_DIR)/s3fp 32 $(N) test_input ./sequential-32 test_output_32 ./sequential-128 test_output_128	

test-pso-par: create-base-conf
	@echo RT = PSO >> s3fp_setting
	@echo PARALLELRT = true >> s3fp_setting
	@echo "==== run s3fp ====" 
	@$(S3FP_DIR)/s3fp 32 $(N) test_input ./sequential-32 test_output_32 ./sequential-128 test_output_128	

clean:
	-rm -f sequential-32 sequential-64 sequential-128 parallel-32 parallel-64 parallel-128
	-rm -f test_input* test_output_*
	-rm -f __outdump
	-rm -f best_input
