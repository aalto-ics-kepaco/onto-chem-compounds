**ABOUT**
-------------
The directory contains the input data used for the classification task and the scripts to generate the data. 

**Contents**
----------------

* onto.babel.phix

    1140x528  input feature matrix, containing babel fingerprint vectors for each input compound.
    
* onto.pubchem.phix
    
    1140x881  pubchem fingerprints.
    
* onto.babPubc.phix 
    
    1140x1409 pubchem and babel fingerprints.
    
All feature matrices are sorted according the CHEBI Ids stored in the first column of the file all_ids_sorted, i.e.  
the first row contains the fingerprints for compound with id “799”, the second row contains the features for 
compound with id “1387” etc. They are retrieved from the database in this order, using the PubChem compound Ids 
stored in the third column of the same file.

* onto.Y
    
    1140x2702 target matrix.

* onto.Yv
    
    1140x1 array, with focal nodes for each molecule (compound).
    
* onto.e
    
    4421x3 edges of the output graph, where nodes are labeled with the their position in the sorted list of all 
    nodes in the graph. They can be mapped back to the original id by finding the element in the given position 
    from the array stored in sorted_output_metlin file.

* dlm_output_metlin 
    
    ASCII-delimited file containing on each row the compounds of interest, and on the columns the subset of 
    the classification (entities) that the compound belongs to.
    
* sorted_output_metlin
    
    sorted array of all entities present in the ontology of our interest. 

* output_Y.m
    
    script to create the target matrix.

* all_ids_sorted 

    three columns of ids in the following order: CHEBI Id, PubChem  substance Id and PubChem compound Id,  for the 1140 metlin compounds sorted according the CHEBi Id. 

    
