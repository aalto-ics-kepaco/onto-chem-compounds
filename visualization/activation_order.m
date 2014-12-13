function  activation_order()


%Ypred=dlmread('/home/milievsk/Documents/SPIN/code/results/Ypred_onto_100_0.8_3_0.7_exp_SPINgreedy.mat');
Ypred=load('/home/milievsk/Documents/MATLAB/final_workNovember/Ypred_onto_100_0.8_3_0.7_exp_SPINgreedy.mat');
%Ypred=YpredVal;
Ypred=Ypred.YpredVal;
Ypred=Ypred(:,2:end);
% all edges in the ontologies
all_edges_unique=dlmread('/home/milievsk/Documents/MATLAB/onto/onto.e');



parfor i=1:size(Ypred,1)
    
     
   
    row_Y=Ypred(i,:);
    active=find(row_Y);
    %edge and activation number
    edges_molecule=zeros(size(find(row_Y),2),4);
    k=1;
    for j=1:size(all_edges_unique,1)
        
        row=all_edges_unique(j,1:2);
        edge=size(intersect(find(row_Y),row(1,1:2)),2);
        if (edge==2)
            
            edges_molecule(k,:)=[row row_Y(1,row(1,1)) row_Y(1,row(1,2))];
            k=k+1;
        
        end
        
        
     end
    
    
     edges_molecule(~any(edges_molecule,2),:)=[];
     edges_molecule=unique(edges_molecule, 'rows');
     name=int2str(i);
     dlmwrite(strcat('/home/milievsk/Documents/MATLAB/final_workNovember/all_edges_mol_actOrderT/molecule',name),edges_molecule,' ');
   
    





end
