Dataset = ReadDataset('train-images.idx3-ubyte');
Labels = ReadLabel('train-labels.idx1-ubyte');

Dataset = greyscale2binary(Dataset);

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

Testset = greyscale2binary(Testset);

Testset = reshape(Testset, [NumberOfColumns*NumberOfRows, NumberOfTestData]);
TestLabels = ReadLabel('t10k-labels.idx1-ubyte');

LabelsPredicted = predict(Model, Testset');

ConfusionMatrix = zeros(10, 10);
for i=1:10
    Index = find(TestLabels == i-1);
    Total = sum(TestLabels == i-1);
    for j=1:10
        ConfusionMatrix(i,j)= sum(LabelsPredicted(Index)==j-1);
    end
end



