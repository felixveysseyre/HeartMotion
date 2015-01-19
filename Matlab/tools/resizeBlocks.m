function [newBlock1, newBlock2, newBlockSize, newBlockCenter] = resizeBlocks(block1, block2, resizingFactor)

    if mod(resizingFactor, 2) == 0
        newBlockSize = resizingFactor*size(block1) + [1, 1];
    else
        newBlockSize = resizingFactor*size(block1);
    end

    newBlock1 = imresize(block1, newBlockSize, 'bilinear');
    newBlock2 = imresize(block2, newBlockSize, 'bilinear');

    newBlockCenter = (newBlockSize + [1, 1]) ./ 2;

end