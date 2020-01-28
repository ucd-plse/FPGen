# Summation benchmarks

navigate to _benchmarks/summations_
  ```
  $ cd /home/fptesting/FPTesting/summations 
  ``` 

## Tests
This folder contains the following 3 tests:  
  ```
  recursive-summation pairwise-summation compensated-summation
  ```
## Results and Logs  
File _reference/result-fpgen.txt_     : includes the FPGen results for the above 3 summation tests  
File _reference/result-baselines.txt_ : includes the RANDOM, S3FP and KLEE-FLOAT results for the 3 summation tests  

For each test, there are two logging files,  
File _reference/TEST.out_             : includes the log of FPGen  
File _reference/TEST-baselines.out_   : includes the log of RANDOM, S3FP and KLEE-FLOAT  

## Steps to Replicate the Results

### Replicate FPGen results  
You can replicate the FPGen results for one or some tests by run:
  ```
  $ nohup ./fpgen.sh TEST1 TEST2 ... &  
  e.g., $ nohup ./fpgen.sh recursive-summation pairwise-summation &  
  ```
or replicate the FPGen results for all 3 summation tests by run: 
  ```
  $ nohup /.fpgen.sh &  
  ```
Each test will take approximately 2 hours, and running FPGen on all tests will take approximately 6~7 hours.

The results will be collected to result-fpgen.txt, you can either inspect these results and compare them to reference manually,   
  ```
  $ cat result-fpgen.txt  
  $ cat reference/result-fpgen.txt  
  ```
or use our script to automatilly check the results of one or some tests:  
  ```
  $ ../../scripts/cmp_to_ref.sh -s result-fpgen.txt reference/result-fpgen.txt TEST1 TEST2 ...  
  e.g., $ ../../scripts/cmp_to_ref.sh -s result-fpgen.txt reference/result-fpgen.txt recursive-summation pairwise-summation  
  ```
or check the results of all tests:  
  ```
  $ ../../scripts/cmp_to_ref.sh -s result-fpgen.txt reference/result-fpgen.txt  
  ```
The comparison script will report "check pass" or "check failed" for each test.  
  
You can also check/compare the log of FPGen for a test:  
  ```
  $ cat TEST.out  
  $ cat reference/TEST.out  
  ```
### Replicate RANDOM/S3FP/KLEE-FLOAT results  
You can replicate the RANDOM/S3FP/KLEE-FLOAT results for one or some tests by run:  
  ```
  $ nohup ./baselines.sh TEST1 TEST2 ... &  
  e.g., $ nohup ./baselines.sh recursive-summation pairwise-summation &  
  ```
or replicate the RANDOM/S3FP/KLEE-FLOAT results for all 3 summation tests by run:  
  ```
  $ nohup /.baselines.sh &  
  ```
Each test will take approximately 4 hours, and running RANDOM/S3FP/KLEE-FLOAT on all tests will take approximately 12~13 hours.

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
