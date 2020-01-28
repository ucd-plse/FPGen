The tests are divided into three parts:  
  * __summations__ (3 summation tests):  
    ```
    recursive-summation pairwise-summation compensated-summation 
    ```
  * __matrix__ (9 meschach tests):
    ```
    sum 1norm 2norm dot conv mv mm lu qr
    ```
  * __gsl__ (15 gsl tests): 
    ```
    wmean wvariance wsd wvariance-w wsd-w wtss wtss-m wvariance-m wsd-m wabsdev wskew wkurtosis wabsdev-m wskew-m wkurtosis-m
    ```
In each part, there is a README file that describes the detailed steps to replicate the results of FPGen or the 3 baseline tools RANDOM, S3FP and KLEE-FLOAT for one, some or all tests in that part.  

To replicate the results of FPGen for all 27 tests at one time, use _fpgen_all.sh_  
```
$ nohup ./fpgen_all.sh &
```
The run will take approximately 54~60 hours, and the FPGen results will be collected in file _result-fpgen.txt_. 
You can either inspect the results manually by comparing them to _reference/result-fpgen-all.txt_ or use our utility script to compare the results automatically by running:
```
../scripts/cmp_to_ref.sh -a result-fpgen.txt reference/result-fpgen-all.txt
```

To replicate the results of RANDOM/S3FP/KLEE-FLOAT for all tests at one time, use _baselines_all.sh_ 
```
$ nohup ./baselines_all.sh & 
```
The run will take approximately 108~120 hours, and the RANDOM/S3FP/KLEE-FLOAT results will be collected in file _result-baselines.txt_. Inspect the results by comparing them to _reference/result-baselines-all.txt_.  
