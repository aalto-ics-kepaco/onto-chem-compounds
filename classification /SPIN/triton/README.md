**ABOUT**
--------------
Script to run the code for SPIN on triton, and folders required to store the results are contained in this directory.
**CONTENTS**
---------------
* onto_code
SPIN code for directed network inference. The code in [spin_gdy](../spin_gdy) directory should be used for the
undirected inference.
* grid_params
Bash script to configure batch jobs, to perform a grid search for paramter selection on triton.
In order to run the script create the following folders in the same directory as the scrip:
jobs_output/ - directory to store the separate sbatch files and outpt files;
tmp/ - to temporary store the results from SPINgreedy.m;
results/ - to store the results from run_SPINgreedy.m
