Dataset = ReadDataset('train-images.idx3-ubyte');
Labels = ReadLabel('train-labels.idx1-ubyte');

NumberOfRows = size(Dataset, 1);
NumberOfColumns = size(Dataset, 2);
NumberOfImages = size(Dataset, 3);

TrainingRate = 1;

Subset = Dataset(:,:,1:TrainingRate*NumberOfImages);
Features = reshape(Subset,[NumberOfColumns*NumberOfRows, TrainingRate*NumberOfImages]); 
FeaturesLabel = Labels(1:TrainingRate*NumberOfImages);
Model = fitcdiscr(Features', FeaturesLabel, 'DiscrimType', 'pseudolinear');

Testset = ReadDataset('t10k-images.idx3-ubyte');
NumberOfTestData = size(Testset, 3);

Testset = reshape(Testset, [NumberOfColumns*NumberOfRows, NumberOfTestData]);
TestLabels = ReadLabel('t10k-labels.idx1-ubyte');

LabelsPredicted = predict(Model, Testset');
