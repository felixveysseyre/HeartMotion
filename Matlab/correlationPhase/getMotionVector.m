function [motionVector] = getMotionVector(R, blockSize, blockCenter)

    blockHalfSize = (blockSize - 1) / 2; 

    blockCorner = blockCenter - blockHalfSize;

    precision = 0.00001;

    kMax = find(abs(R - max(R(:))) < precision);
    
    [iMax, jMax] = ind2sub(blockSize, kMax);

    iMaxMean = round(sum(iMax) / length(iMax));
    jMaxMean = round(sum(jMax) / length(jMax));

    correlationMax = blockCorner + [iMaxMean, jMaxMean] - [1, 1];

    motionVector = blockCenter - correlationMax;

end