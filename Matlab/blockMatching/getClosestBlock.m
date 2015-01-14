function [closestBlockCenter] = getClosestBlock(block2, image1, blockCenter, stepSize)

    [h, w] = size(image1);

    blockSize = size(block2, 1); 

    iMax = stepSize;
    jMax = stepSize;

    blockCenters = zeros(9, 2);
    similarity = inf(9, 1); 

    k = 1;
    
    for i = [0, -iMax, iMax]
        
        for j = [0, -jMax, jMax]

            if blockCenter(1)+i > 0 ...
            && blockCenter(2)+j > 0 ...
            && blockCenter(1)+i <= h ...
            && blockCenter(2)+j <= w

                blockCenterTranslated = blockCenter + [i, j];

                block1 = getBlock(image1, blockCenterTranslated, blockSize);

                if size(block1) == size(block2)
                    
                    blockCenters(k, :) = blockCenterTranslated;
                    similarity(k) = computeBlocksSimilarity(block1, block2);
                    
                end
                
            end

            k = k + 1;
            
        end
    end

    indexMin = find(similarity == min(similarity));
    closestBlockCenter = blockCenters(indexMin(1), :);

end

