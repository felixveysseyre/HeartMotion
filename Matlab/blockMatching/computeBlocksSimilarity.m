function [similarity] = computeBlocksSimilarity(block1, block2)

    if size(block1) == size(block2)
        
        blockDiff = abs(block1 - block2);
        similarity = sum(blockDiff(:));
        
    else
        
        similarity = inf;
        
    end

end