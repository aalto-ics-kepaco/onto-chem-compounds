% script to create the target matrix for the ontologies.

%comp_ids contains all 2702 compounds sorted accroding their ids.
%comp_mat is a matrix with rows corresponidng to the compounds of interest(leaf node) and columns
%corresponding to the compounds (nodes) present in the ontology for the given leaf node.  
function target_mat = output_Y() 

target_mat=zeros(1140,2702);


comp_mat=dlmread('/home/milievsk/Documents/scripts/dlm_output_metlin');
comp_ids=dlmread('/home/milievsk/Documents/scripts/sorted_output_metlin');

%sort the comp_mat according the first column corresponding to the leaf id
[s,ind]=sort(comp_mat(:,1));
sorted_comp=comp_mat(ind,:);

for i=1:size(sorted_comp,1)
    %find the nonzero elements in the matrix, look for their position in
    %the sorted list and fill in the target_mat
   leaf_ont=sorted_comp(i,find(sorted_comp(i,1:end)));
   [r,pos]=ismember(leaf_ont,comp_ids);
   target_mat(i,pos)=1;
  
end
  

end
