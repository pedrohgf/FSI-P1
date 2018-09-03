function binaryImage = grayscale2binary(image)

binaryImage = image;
binaryImage(find(binaryImage<128)) = 0;
binaryImage(find(binaryImage>=128)) = 255;

end