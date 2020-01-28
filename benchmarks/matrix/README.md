# Meschach benchmarks

navigate to _benchmarks/matrix_
  ```
  $ cd /home/fptesting/FPTesting/benchmarks/matrix 
  ``` 

## Tests
This folder contains the following 9 tests of meschach library:  
  ```
  sum 1norm 2norm dot conv mv mm lu qr  
  ```
## Results and Logs
File _reference/result-fpgen.txt_     : includes the FPGen results for the above 9 tests  
File _reference/result-baselines.txt_ : includes the RANDOM, S3FP and KLEE-FLOAT results for the 9 tests  

For each test, there are two logging files,  
File _reference/TEST.out_             : includes the log of FPGen  
File _reference/TEST-baselines.out_   : includes the log of RANDOM, S3FP and KLEE-FLOAT  

## Steps to Replicate the Results  

### Replicate FPGen results 
You can replicate the FPGen results for one or some tests by run:  
  ```
  $ nohup ./fpgen.sh TEST1 TEST2 ... &  
  e.g., $ nohup ./fpgen.sh sum 1norm &  
  ```
or replicate the FPGen results for all 9 meschach tests by run: 
  ```
  $ nohup /.fpgen.sh &  
  ```
Each test will take approximately 2 hours, and running FPGen on all tests will take approximately 18~20 hours.  

The results will be collected to result-fpgen.txt, you can either inspect these results and compare them to reference manually,   
  ```
  $ cat result-fpgen.txt  
  $ cat reference/result-fpgen.txt  
  ```
or use our script to automatilly check the results of one or some tests:  
  ```
  $ ../../scripts/cmp_to_ref.sh -m result-fpgen.txt reference/result-fpgen.txt TEST1 TEST2 ...  
  e.g., $ ../../scripts/cmp_to_ref.sh -m result-fpgen.txt reference/result-fpgen.txt sum 1norm  
  ```
or check the results of all tests:  
  ```
  $ ../../scripts/cmp_to_ref.sh -m result-fpgen.txt reference/result-fpgen.txt 
  ```
The comparison script will report "check pass" or "check failed" for each test.   
  
You can check/compare the log of FPGen for a test:
  ```
  $ cat TEST.out  
  $ cat reference/TEST.out  
  ```
### Replicate RANDOM/S3FP/KLEE-FLOAT result  
You can replicate the RANDOM/S3FP/KLEE-FLOAT results for one or more tests by run:  
  ```
  $ nohup ./baselines.sh TEST1 TEST2 ... &  
  e.g., $ nohup ./baselines.sh sum 1norm &  
  ```
or replicate the RANDOM/S3FP/KLEE-FLOAT results for all 9 meschach tests by run: 
  ```
  $ nohup /.baselines.sh &  
  ```
Each test will take approximately 4 hours, and running RANDOM/S3FP/KLEE-FLOAT on all tests will take approximately 36~40 hours.
 
Check/compare the results of RANDOM/S3FP/KLEE-FLOAT for one or more tests:  
  ```
  $ cat result-baselines.txt  
  $ cat reference/result-baselines.txt  
  ```
Check/compare the log of RANDOM/S3FP/KLEE-FLOAT for one test:  
  ```
  $ cat TEST-baselines.out  
  $ cat reference/TEST-baselines.out 
  ```
## Clean
Clean all results and temporary files by run:  
  ```
  $ rm -rf result-*.txt *.out  
  $ ./clean.sh  
  ```
