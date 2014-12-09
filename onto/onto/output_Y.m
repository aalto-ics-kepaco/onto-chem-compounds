function  target_mat=output_Y() 


%change the path to the files 
comp_mat=dlmread('/home/milievsk/Documents/scripts/dlm_output_metlin');
comp_ids=dlmread('/home/milievsk/Documents/scripts/sorted_output_metlin');
target_mat=zeros(size(comp_mat,1),size(comp_ids,1));

%sort the comp_mat according the first column corresponding to the compound  of interest id
[s,ind]=sort(comp_mat(:,1));
sorted_comp=comp_mat(ind,:);

%find the nonzero elements in the matrix, look for their position in
%the sorted list and fill in the target_mat
for i=1:size(sorted_comp,1)
   leaf_ont=sorted_comp(i,find(sorted_comp(i,1:end)));
   [r,pos]=ismember(leaf_ont,comp_ids);
   target_mat(i,pos)=1;
  
end
  

end
