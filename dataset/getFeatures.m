function Set = getFeatures(Set)

m = size(Set,1);
n = size(Set,2);
p = size(Set,3);

aux = zeros(p,m*n);

for i=1:p
    a = Set(:,:,i);
    aux(i,1:m*n) = a(:)';
end

Set = aux;

end
