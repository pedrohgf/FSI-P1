function Labels = ReadLabel(filename)

LabelID = fopen(filename, 'rb');

LabelHeader = fread(LabelID, 2, 'int32', 0, 'ieee-be'); 

Labels = fread(LabelID, Inf, 'unsigned char');

end