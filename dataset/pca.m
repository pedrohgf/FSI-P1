function Z = pca(X,K)

for i=1:size(X,2)
    X(i,:) = X(i,:) - mean(X(i,:)); %feature normalization
end

Sigma = cov(X);

[U, S, V] = svd(Sigma);

Z = zeros(size(X, 1), K);
for i=1:size(X,1)
    
    x = X(i,:)';
    Z(i,:) = x'*U(:,K); %projects the data into a K dimension

end


