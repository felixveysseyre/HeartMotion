function [imageNoised] = addNoiseToImage(image, mu, sigma, vMin, vMax)

    [h, w] = size(image);

    noise = mu + sigma * randn(h, w);

    imageNoised = image + noise;
    
    imageNoised(imageNoised < vMin) = vMin;
    imageNoised(imageNoised > vMax) = vMax;
    
end