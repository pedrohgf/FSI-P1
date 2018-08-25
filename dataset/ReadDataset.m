function TrainingSet = ReadDataset(filename)

TrainingSetID = fopen(filename, 'rb');

TrainingSetHeader = fread(TrainingSetID, 4, 'int32', 0, 'ieee-be'); 

NumberOfItens = TrainingSetHeader(2);
NumberOfRows = TrainingSetHeader(3);
NumberOfColumns = TrainingSetHeader(4);

TrainingSet = fread(TrainingSetID, Inf, 'unsigned char');
TrainingSet = reshape(TrainingSet, NumberOfRows, NumberOfColumns, NumberOfItens);
TrainingSet = permute(TrainingSet, [2 1 3]);

end
