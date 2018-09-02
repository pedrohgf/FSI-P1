function [testErr, labels_test] = runKNN(TrainingSet, TrainingSetLabels, TestSet, TestSetLabels)
tic

nNeighbours = [30;245;400;700;1000;3000;10000];
ValidationSet = TestSet(1:5000,:);
ValidationSetLabels = TestSetLabels(1:5000);
TestSet = TestSet(5001:end,:);
TestSetLabels = 

labels_test = zeros(length(TestSetLabels),7);

for i=1:7
    
    mdl = fitcknn(TrainingSet,TrainingSetLabels,'NumNeighbors',nNeighbours(i));
    labels_test(:,i) = predict(mdl,TestSet);
    testErr(i) = sum((labels_test(:,i) ~= TestSetLabels))/length(labels_test(:,i));
    
end

toc



