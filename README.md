onto-chem-compounds
===================

**About**
--------------------
Code for classification of a molecular species in an ontology from molecular fingerprints.  Fingerprints are used to represent chemical compounds, and for each of the compounds there exists an ontological classification in form of a directed acyclic graph (DAG). 

**Methods**
----------------------
We use two methods in this project. First we use structured prediction method developed for network response named [SPIN (Structured Prediction of Network Response)](http://jmlr.org/proceedings/papers/v32/su14.pdf). The input is a set of fingerprint vectors of some chemical compounds and the output is a DAG.  Then we use SVM as a single target classifier. 

**Data preparation**
------------------------
The ontology data are downloaded from [ChEBI](http://www.ebi.ac.uk/chebi/aboutChebiForward.do). We have the fingerprints for all the compounds in PubChem. We use 1141 compounds from the [metlin ontology](metlin_onto/) (ask author for complete directory) for which we already have the outputs (DAGs). 

To get the input fingerprint vectors, several mappings are needed: first PubChem substance Id is retrieved for each CHEBI Id from the meta-info file, [CHEBI_complete.sdf](http://www.ebi.ac.uk/chebi/downloadsForward.do).  For the compound with id “ 4194” I couldn't find links to Pubchem substance Id, neither from the meta-info file nor from the CHEBI database, therefore I use 1140 compounds for the classification task. 

Next, PubChem compound Id can be retrieved from the PubChem substance Id by using the [service](https://pubchem.ncbi.nlm.nih.gov/idexchange/idexchange.cgi) provided by PubChem. The file  [all_ids_sorted](onto/all_ids_sorted)  in the folder [onto](onto) contains all the ids; CHEBI Id, PubChem  substance Id and PubChem compound Id.

From here, by using the PubChem compound Ids we can retrieve the fingerprint vectors, there are openbabel 
fingerprints (FP3, FP4 and MACCS) all together 528 bits and PubChem fingerprints (998 bits). 

**Contents**
-------------

* classification 

    A directory containing the matlab scripts for running SPIN and SVM. 
    
* metlin_onto 

    The folder contains the sub-ontology (Each compound ontology will be a subset of the underlying ontology) 
    for 1141 compounds in metlin ontology.    
    
* onto

    The directory contains the input data used for the classification task and the scripts to generate the data. 
