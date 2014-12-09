**ABOUT**
-------------
Code for running the GREEDY approach of the method SPIN. The method is implemented by 
[Hongyu SU](https://github.com/hongyusu) and in this project we use the original implementation. 

The directory contains the code for running the method locally and on triton, the computing cluster at Aalto University. 

* spin_gdy

    The directory contains the scripts to run the GREEDY labeling version of SPIN. Script onto_greedy_labeling has been 
    implemented by the original author to suit the intology data for directed inference. The scripts run_SPIN_Greedy and SPIn_Greedy have been only modified to take the input from the ontology data and the output the corresponding results.
    
* triton 

    Scripts to run grid search for sets of parameters on triton. 

