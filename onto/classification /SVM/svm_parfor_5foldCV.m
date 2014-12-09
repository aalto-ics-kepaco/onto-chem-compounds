function svm_parfor_5foldCV()


%c is the cost parameter
%X=dlmread('/home/milievsk/Documents/MATLAB/onto.babel.phix');
%Y is the target matrix
Y=dlmread('/home/milievsk/Documents/MATLAB/onto/onto.Y');
%Y=dlmread('../onto/onto.babel.phix');
%chebi_ids is a sorted array of the chebi ids in ascending order
chebi_ids=dlmread('/home/milievsk/Documents/scripts/chebi_ordered');
%chebi_ids=dlmread('../onto/chebi_ordered');



Ysize=size(Y,2);
num_samples=size(Y,1);

% divide data into 80-20%, train and test sets
c=cvpartition(num_samples,'HoldOut',0.2);
trainIndex=c.TrainSize;

%range to select from for the cost param
stepSize=1;
log2c_list=-20:stepSize:10;
numLog2c=length(log2c_list);

%predicited labels
Ypredicted=zeros(c.TestSize,Ysize);
Y_true=Y(c.TrainSize+1:end,:);

parfor i=1:size(Y,2)
    
    X=dlmread('/home/milievsk/Documents/MATLAB/onto/onto.babel.phix');
    %X=dlmread('../onto/onto.babel.phix');
    Y_current=Y(:,i);
    Y_train=Y_current(1:trainIndex);
    Y_test=Y_current(trainIndex+1:end);
    
    
    bestCV=0;
    for j=1:numLog2c
        log2c=log2c_list(j);
        params=['-v 5 -c ',num2str(2^log2c),'-t 0'];
        cv=svmtrain(Y_train,X(1:trainIndex,:),params);
    
        if (cv>=bestCV)
            bestCV=cv; bestc=2^log2c; 
        end
    
    end
    
    best_params=['-t 0 -c ', num2str(bestc)];
    bestM=svmtrain(Y_train,X(1:trainIndex,:),best_params);
    predicted_label=svmpredict(Y_test,X(trainIndex+1:end,:),bestM);
    Ypredicted(:,i)=predicted_label;
    
   
    

end

filename='svm_linear_results_comp'
save(filename,'Ypredicted');
%save(sprintf('results/svm_rbf_%s',fn),'Ypredicted');

end














