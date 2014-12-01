onto-chem-compounds
===================

**About**
--------------------
Code for classification of a molecular species in an ontology from molecular fingerprints.  Fingerprints are used to represent chemical compounds, and for each of the compounds there exists a ontological classification in form of a directed acyclic graph (DAG). 

**Methods**
First we use structured prediction method developed for network response named SPIN. The input is a set of fingerprint vectors of some chemical compounds {x 1 , . . . , x n }, ∀x i ∈ Rm  and the output is a DAG.  Then we use SVM as a single target classifier. 

**Data preparation**
The ontology data are downloaded from ChEBI. We have the fingerprints for all the compounds in PubChem. We use 1141 compounds from the metlin ontology in which we already have the output (DAG). 

To get the input fingerprint vectors, several mappings are needed: first PubChem substance Id is retrieved for each CHEBI Id from the meta-info file, CHEBI_complete.sdf.  For the compound with id “ 4194” I couldn't find links to Pubchem substance Id, neither from the meta-info file nor from the CHEBI database, therefore I use 1140 compounds for the classification task. 

Next, PubChem compound Id can be retrieved from the PubChem substance Id by using the service provide by PubChem. The file all_ids_sorted contains three columns of ids, in the following order: CHEBI Id, PubChem  substance Id and PubChem compound Id,  for the 1140 metlin compounds sorted according the CHEBi Id.  
From here, by using the PubChem compound Ids we can retrieve the fingerprint vectors, there are openbabel 
fingerprints (FP3, FP4 and MACCS) all together 528 bits and PubChem fingerprints (998 bits). The files pubchemfp and babelfp contain the retrieved fingerprints.
