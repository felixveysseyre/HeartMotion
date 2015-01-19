function [block] = getBlock(image, blockCenter, blockSize)
 
    imageSize = size(image);

    radius = (blockSize - 1) / 2;

    iStart = max(blockCenter(1) - radius, 1);
    jStart = max(blockCenter(2) - radius, 1);

    iEnd = min(blockCenter(1) + radius, imageSize(1));
    jEnd = min(blockCenter(2) + radius, imageSize(2));

    block = image(iStart:1:iEnd, jStart:1:jEnd);

end