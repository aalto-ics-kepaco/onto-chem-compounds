**ABOUT**
-------------
This directory contains the code for visualization of the predictions. In order to create a visual representation of the predicted graphs follow the procedure:

First run tne script [activation_order.m](activation_order.m) in order to create separate files for each compound containg the edges that were predicted for the compound. The resulting files contain the node ids for each edge in the first and second column, and the activation order in the graph in the 3rd and 4th column for the both nodes accordingly.
Next, run the bash [create_dot](create_dot) script in order to transform the files in the format required by the visualization software [graphiz](http://www.graphviz.org/) that we use to generate the graphs. After converting the files to the dot language format, the scripts generates the pdf files with the visualized predicted graph. 

The directory [3_0.7](3_0.7) contains the dot files along the visualized predictions comparing the original ontology with the SPIN (params: radius=3, penalty=0.7) and SVM predictions. In the .pdf files, the graphs are given in the following order from left to right: the original graph with the root node labeled with the id, the svm graph with root node labeled with "id_gv1", and finally the SPIN predictions with root node labeled with "id_gv2".

 
