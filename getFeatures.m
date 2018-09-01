function Set = getFeatures(Set) 
tic
out = zeros(size(Set,3),128);

aux = zeros(32,32,size(Set,3));
aux(1:28,1:28,:) = Set;

 aux = 2.*((aux - min(aux(:)))./(max(aux(:)) - min(aux(:)))) -1;
 Blocks = cell(16,size(aux,3));
 
 for i=1:size(aux,3)
    Blocks(:,i) = getBlocks(8,aux(:,:,i));
 end


 for i=1:size(Blocks,2)
     zzBlocks_matrix = [];
     for j=1:16
    
        Blocks{j,i} = dct2(Blocks{j,i});
        zzBlocks_matrix = [zzBlocks_matrix ; zigZag(Blocks{j,i})];
    
     end
     
     a = zzBlocks_matrix(:,1:8);
     out(i,:) = a(:)';
 end

Set=out;
toc
end