%script principal para rodar o KNN

TrainingSet = ReadDataset('train-images.idx3-ubyte');
TestSet = ReadDataset('t10k-images.idx3-ubyte');
TrainingSetLabels = ReadLabel('train-labels.idx1-ubyte');
TestSetLabels = ReadLabel('t10k-labels.idx1-ubyte');

TrainingSet = getFeatures(TrainingSet); %dct features

TestSet = getFeatures(TestSet); %dct features

[testErr, labels_test] = runKNN(TrainingSet, TrainingSetLabels, TestSet, TestSetLabels);


