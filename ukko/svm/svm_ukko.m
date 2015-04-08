function svm_ukko()


addpath('~//softwares/libsvm-3.12/matlab')
Y=dlmread('../../onto/onto.Y');
%Y=dlmread('../onto/onto.babel.phix');
%chebi_ids is a sorted array of the chebi ids in ascending order
%chebi_ids=dlmread('/home/milievsk/Documents/scripts/chebi_ordered');

nfold=5;
c=100;
params=['-t 0 -c ',num2str(c)];

Ypredicted=zeros(size(Y));


parfor i=1:size(Y,2)
    
    Ypred=zeros(size(Y,1),1);

    X=dlmread('../../onto/onto.babPubc.phix');
    %X=dlmread('../onto/onto.babel.phix');
    Y_current=Y(:,i);
    Ind=crossvalind('kfold',Y_current,nfold);
    for k=1:nfold
        Itrain=find(Ind~=k);
        Itest=find(Ind==k);
        %model=svmtrain(Y_current(Itrain,1),X(Itrain,:),'-t 0 -c 100');
        model=svmtrain(Y_current(Itrain,:),X(Itrain,:),params); 
        predicted_label=svmpredict(Y_current(Itest,1),X(Itest,:),model);
        Ypred(Itest,1)=predicted_label;
        
    end
    
    Ypredicted(:,i)=Ypred;
    
end

filename='svm_linear_results_comp_100'
save(filename,'Ypredicted','Y');
