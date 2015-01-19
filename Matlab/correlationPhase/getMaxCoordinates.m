function [maxCoord] = getMaxCoordinates(R, blockSize)

    precision = 10^-5;

    kMax = find(abs(R - max(R(:))) < precision);
    
    [iMax, jMax] = ind2sub(blockSize, kMax);

    iMaxMean = round(sum(iMax) / length(iMax));
    jMaxMean = round(sum(jMax) / length(jMax));

    maxCoord = [iMaxMean, jMaxMean]; 

end